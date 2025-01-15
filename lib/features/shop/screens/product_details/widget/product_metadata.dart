import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:interior_coffee/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:interior_coffee/common/widgets/image/t_circular_image.dart';
import 'package:interior_coffee/common/widgets/text/product_price_text.dart';
import 'package:interior_coffee/common/widgets/text/product_title_text.dart';
import 'package:interior_coffee/data/response/products_response.dart';
import 'package:interior_coffee/features/shop/screens/product_details/widget/brand_title_with_verification.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/constants/enums.dart';
import 'package:interior_coffee/utils/constants/image_strings.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:interior_coffee/utils/helpers/function_helper.dart';
import 'package:intl/intl.dart';

import '../../../../../utils/constants/ref_data.dart';
import '../../../../authentication/controllers/auth_controller.dart';
import '../../../../chat/screens/box_chat_page.dart';

class TProductMetadata extends StatelessWidget {
  final Product info;
  const TProductMetadata({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    var formatter = NumberFormat.decimalPattern('vi_VN');
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text('${info.discount}%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.black)),
            ),
            SizedBox(width: TSizes.spaceBtwItems),

            //price
            Text('${formatter.format(info.truePrice)}đ',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough)),
            SizedBox(width: TSizes.spaceBtwItems),
            TProductPriceText(price: formatter.format(info.truePrice), isLarge: true),
          ],
        ),

        SizedBox(height: TSizes.spaceBtwItems / 1.5),

        //title
        TProductTitleText(title: info.name ?? ''),
        SizedBox(height: TSizes.spaceBtwItems / 1.5),

        //stock
        Row(
          children: [
            TProductTitleText(title: 'Quantity :'),
            SizedBox(width: TSizes.sm),
            Text('${info.quantity ?? 0} in Stock',
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 1.5),

        //merchant
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                TCircularImage(
                  image: TImages.cosmeticsIcon,
                  width: 32,
                  height: 32,
                  overlayColor: dark ? TColors.white : TColors.black,
                ),
                SizedBox(width: 8),
                TBrandTitleWithVerifiedIcon(
                  title: 'Tien Phu Furniture',
                  brandTextSize: TextSizes.medium,
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.chat_outlined),
              onPressed: () async {
                final String shopId = info.merchantId ?? '';
                await fetchMerchantData(shopId);
                final String? currentUserEmail =
                    AuthController.instance.userData.value.email;
                final String? currentUserName =
                    AuthController.instance.userData.value.userName;
                final String? currentUserId =
                    AuthController.instance.userData.value.id;
                try {
                  // Fetch all documents in the 'chats' collection
                  final querySnapshot = await FirebaseFirestore.instance
                      .collection('chats')
                      .get();
                  String? chatId;
                  String? chatTitle;

                  // Iterate through the documents to find a match
                  for (var doc in querySnapshot.docs) {
                    final data = doc.data();

                    // Check if 'participants' exists and is a List
                    if (data.containsKey('participants') &&
                        data['participants'] is List) {
                      final participants = data['participants'] as List;

                      // Check if participants contain an email match
                      final hasShopEmail = participants.any((participant) =>
                          participant is Map<String, dynamic> &&
                          participant['email'] == RefData.currentMerchantEmail);

                      if (hasShopEmail) {
                        chatId = doc.id;
                        chatTitle = data['title'];
                        print('Chat Found!');
                        print('Chat ID: $chatId');
                        print('Title: $chatTitle');
                        break;
                      }
                    } else {
                      print('Participants is not a List or missing.');
                    }
                  }

                  if (chatId != null && chatTitle != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BoxChatPage(chatId: chatId!, title: chatTitle!),
                      ),
                    );
                  } else {
                    print(
                        'No chat found for shopEmail: ${RefData.currentMerchantEmail}');

                    // Create a new document in the 'chats' collection
                    final newChatRef =
                        FirebaseFirestore.instance.collection('chats').doc();

                    final now = DateTime.now();

                    final newChat = {
                      'updatedAt': now,
                      'createdAt': now,
                      'title': RefData.currentMerchantName,
                      'participants': [
                        {
                          'avatar': '',
                          'email': RefData.currentMerchantEmail,
                          'id': shopId,
                          'name': RefData.currentMerchantName,
                          'role': 'merchant',
                        },
                        {
                          'avatar': '',
                          'email': currentUserEmail,
                          'id': currentUserId,
                          'name': currentUserName,
                          'role': 'customer',
                        }
                      ],
                      'lastMessage': {
                        'content': '',
                        'senderId': '',
                        'email': '',
                        'timestamp': null,
                        'type': '',
                      },
                    };

                    await newChatRef.set(newChat);

                    chatId = newChatRef.id;
                    chatTitle = newChat['title'] as String?;
                    print('New chat created with ID: $chatId');

                    // Navigate to the chat page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BoxChatPage(chatId: chatId!, title: chatTitle!),
                      ),
                    );
                  }
                } catch (e) {
                  print('Error while fetching chats: $e');
                }
              },
            ),
          ],
        )
      ],
    );
  }
}

Future<void> fetchMerchantData(String merchantId) async {
  final String apiUrl =
      'https://interior-coffee-api-f2d9dqd2eyccesfq.southeastasia-01.azurewebsites.net/api/v1/merchants/$merchantId';

  try {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      // Update RefData
      RefData.currentMerchantId = data['_id'];
      RefData.currentMerchantName = data['name'];
      RefData.currentMerchantEmail = data['email'];

      print('Merchant data fetched successfully!');
    } else {
      print(
          'Failed to fetch merchant data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching merchant data: $e');
  }
}
