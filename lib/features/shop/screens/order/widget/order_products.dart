import 'package:flutter/material.dart';
import 'package:interior_coffee/common/widgets/image/t_rounded_image.dart';
import 'package:interior_coffee/common/widgets/text/product_price_text.dart';
import 'package:interior_coffee/data/response/order_response.dart';
import 'package:interior_coffee/utils/constants/colors.dart';
import 'package:interior_coffee/utils/constants/sizes.dart';
import 'package:intl/intl.dart';

class OrderProductsWidget extends StatelessWidget {
  final List<OrderProduct> products;
  final double totalPrice;
  const OrderProductsWidget({super.key, required this.products, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat.decimalPattern('vi_VN');
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: TColors.grey,
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Product List : ',
            style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: TSizes.spaceBtwItems),
          ListView.builder(
            itemBuilder: (insContext, int index) {
              return _ProductWidget(
                product: products[index],
              );
            },
            itemCount: products.length,
            shrinkWrap: true,
            padding: EdgeInsetsDirectional.all(0.8),
            physics: NeverScrollableScrollPhysics(),
          ),
          Divider(),
          /*Align(
              alignment: Alignment.bottomRight,
              //child: Text('Total price: $totalPrice', style: TextStyle(fontWeight: FontWeight.w700))

            ),*/
          Padding(
            padding: const EdgeInsets.only(left: 150),
            child: Row(
              children: [
                Text('Total Price :'),
                Padding(
                  padding: EdgeInsets.only(left: TSizes.sm),
                  child: TProductPriceText(price: formatter.format(totalPrice)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductWidget extends StatelessWidget {
  final OrderProduct product;
  const _ProductWidget({required this.product});

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat.decimalPattern('vi_VN');
    
    return Row(
      children: [
        TRoundedImage(
          imageUrl: product.image ?? '',
          applyImageRadius: true,
          isNetworkImage: (product.image?.isNotEmpty == true),
          width: 50,
          height: 80,
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.name ?? '',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                )),
            Text(
              'Quantity: ${product.quantity}',
            ),
            /*Text(
              'Price: ${product.price} VND',
              style: TextStyle(fontWeight: FontWeight.w500),
            )*/
            Row(
              children: [
                Text('Price :'),
                Padding(
                    padding: EdgeInsets.only(left: TSizes.sm),
                    child: TProductPriceText(price: formatter.format(product.price)),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
