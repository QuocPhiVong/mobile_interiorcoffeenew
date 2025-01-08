import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interior_coffee/features/chat/screens/box_chat_page.dart';
import 'package:interior_coffee/utils/constants/image_strings.dart';
import 'package:intl/intl.dart';

import '../../../common/widgets/image/t_circular_image.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/function_helper.dart';
import '../../authentication/controllers/auth_controller.dart';

class ChatListScreen extends StatefulWidget {
  @override
  _ChatListScreenState createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  String? userEmail = '';
  String? userId = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      userEmail = AuthController.instance.userData.value.email;
      userId = AuthController.instance.userData.value.id;
    });
  }

  String formatTimestamp(Timestamp timestamp) {
    final DateTime date = timestamp.toDate();
    final DateTime now = DateTime.now();

    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      return DateFormat('HH:mm').format(date); // If today, show time
    } else {
      return DateFormat('dd-MM-yyyy').format(date); // Not today, show date
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('chats')
            .orderBy('updatedAt', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No chats found.'));
          }

          final chats = snapshot.data!.docs.where((doc) {
            final chatData = doc.data() as Map<String, dynamic>;
            final participants = chatData['participants'];

            if (participants is List) {
              return participants.any((participant) {
                final participantData = participant as Map<String, dynamic>;
                return participantData['email'] == userEmail;
              });
            } else if (participants is Map) {
              return participants.values.any((participant) {
                final participantData = participant as Map<String, dynamic>;
                return participantData['email'] == userEmail;
              });
            }
            return false;
          }).toList();

          if (chats.isEmpty) {
            return Center(child: Text('No chats found.'));
          }

          return ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              final chat = chats[index];
              final chatData = chat.data() as Map<String, dynamic>;
              final shopName = chatData['title'] as String? ?? 'Unknown';
              final lastMessage =
                  chatData['lastMessage'] as Map<String, dynamic>?;
              final lastMessageContent =
                  lastMessage?['content'] ?? 'No messages yet';
              final lastMessageTimestamp =
                  lastMessage?['timestamp'] as Timestamp?;
              final lastMessageTime = lastMessageTimestamp != null
                  ? formatTimestamp(lastMessageTimestamp)
                  : 'N/A';

              return Dismissible(
                key: ValueKey(chat.id), // Unique key for each item
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                confirmDismiss: (direction) async {
                  // Show confirm dialog when the trash bin is tapped
                  return await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Confirm Deletion'),
                      content:
                          Text('Are you sure you want to delete this chat?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Perform delete operation
                            FirebaseFirestore.instance
                                .collection('chats')
                                .doc(chat.id)
                                .delete();
                            Navigator.of(context).pop(true);
                          },
                          child: Text('Delete'),
                        ),
                      ],
                    ),
                  );
                },
                child: ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                    child: TCircularImage(
                      image: TImages.cosmeticsIcon,
                      width: 32,
                      height: 32,
                      overlayColor: dark ? TColors.white : TColors.black,
                    ),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        shopName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        lastMessageTime,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    lastMessageContent,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  onTap: () {
                    print("User ID: $userId");
                    print("user email: $userEmail");
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            BoxChatPage(chatId: chat.id, title: shopName),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.easeInOut;

                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));
                          var offsetAnimation = animation.drive(tween);

                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
