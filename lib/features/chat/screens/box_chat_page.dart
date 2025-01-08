import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common/widgets/image/t_circular_image.dart';
import '../../../utils/constants/image_strings.dart';
import '../../authentication/controllers/auth_controller.dart';

class BoxChatPage extends StatefulWidget {
  final String chatId;
  final String title;

  const BoxChatPage({super.key, required this.chatId, required this.title});

  @override
  _BoxChatPageState createState() => _BoxChatPageState();
}

class _BoxChatPageState extends State<BoxChatPage> {
  final String? userEmail = AuthController.instance.userData.value.email;
  final String? userId = AuthController.instance.userData.value.id;
  Map<String, bool> visibleStatuses =
      {}; // Track visibility of statuses by message ID

  @override
  void initState() {
    super.initState();
    _updateMessageStatus();
  }

  void _updateMessageStatus() async {
    final messagesSnapshot = await FirebaseFirestore.instance
        .collection('chats')
        .doc(widget.chatId)
        .collection('messages')
        .where('status', isEqualTo: 'sent')
        .get();

    final batch = FirebaseFirestore.instance.batch();

    for (var doc in messagesSnapshot.docs) {
      final messageData = doc.data();
      // if (messageData['email'] != userEmail) {
      //   batch.update(doc.reference, {'status': 'read'});
      // }
      if (messageData['senderId'] != userId) {
        batch.update(doc.reference, {'status': 'read'});
      }
    }

    await batch.commit();
  }

  void toggleStatusVisibility(String messageId) {
    setState(() {
      visibleStatuses[messageId] = !(visibleStatuses[messageId] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('chats')
                  .doc(widget.chatId)
                  .collection('messages')
                  .orderBy('timestamp', descending: false)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No messages found.'));
                }

                final messages = snapshot.data!.docs;

                return ListView.builder(
                  reverse: false,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final messageDoc = messages[index];
                    final message = messageDoc.data() as Map<String, dynamic>;
                    final content = message['content'] ?? '';
                    final timestamp = message['timestamp'] as Timestamp?;
                    final time = timestamp != null
                        ? DateFormat('HH:mm').format(timestamp.toDate())
                        : 'N/A';
                    final status = message['status'] ?? '';
                    final messageId = messageDoc.id;

                    //final isSender = message['email'] == userEmail;
                    final isSender = message['senderId'] == userId;

                    // Parse the current message's date
                    final messageDate = timestamp?.toDate();
                    final DateTime now = DateTime.now();
                    final String formattedDate = messageDate != null
                        ? (messageDate.day == now.day &&
                                messageDate.month == now.month &&
                                messageDate.year == now.year
                            ? 'Today'
                            : DateFormat('dd/MM/yyyy').format(messageDate))
                        : 'N/A';

                    final bool showDateDivider = index == 0 ||
                        (index > 0 &&
                            timestamp != null &&
                            (messages[index - 1].data()
                                        as Map<String, dynamic>)['timestamp']
                                    ?.toDate()
                                    ?.day !=
                                messageDate?.day);

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (showDateDivider)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  formattedDate,
                                  style: TextStyle(
                                    color: formattedDate == 'Today'
                                        ? Colors.black
                                        : Colors.black87,
                                    fontWeight: formattedDate == 'Today'
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        GestureDetector(
                          onTap: () => toggleStatusVisibility(messageId),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: isSender
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              if (!isSender)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.blue,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: TCircularImage(
                                      image: TImages.cosmeticsIcon,
                                      width: 24,
                                      height: 24,
                                      overlayColor: Colors.black,
                                    ),
                                  ),
                                ),
                              // Message Bubble
                              Column(
                                crossAxisAlignment: isSender
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    constraints: BoxConstraints(
                                      maxWidth: screenWidth * 0.6,
                                    ),
                                    margin: EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: isSender ? 16 : 5,
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: isSender
                                          ? Colors.blue
                                          : Colors.grey.shade300,
                                      borderRadius: BorderRadius.only(
                                        topLeft: isSender
                                            ? Radius.circular(10)
                                            : Radius.zero,
                                        topRight: isSender
                                            ? Radius.zero
                                            : Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          content,
                                          style: TextStyle(
                                            color: isSender
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          time,
                                          style: TextStyle(
                                            color: isSender
                                                ? Colors.white70
                                                : Colors.grey.shade600,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (visibleStatuses[messageId] == true)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10, bottom: 5),
                                      child: Text(
                                        'Status: $status',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          _MessageInput(chatId: widget.chatId),
        ],
      ),
    );
  }
}

class _MessageInput extends StatefulWidget {
  final String chatId;

  const _MessageInput({super.key, required this.chatId});

  @override
  __MessageInputState createState() => __MessageInputState();
}

class __MessageInputState extends State<_MessageInput> {
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    FirebaseFirestore.instance
        .collection('chats')
        .doc(widget.chatId)
        .collection('messages')
        .add({
      'chatId': widget.chatId,
      'content': _controller.text.trim(),
      'fileUrl': '',
      'senderId': AuthController.instance.userData.value.id,
      'status': 'sent',
      'timestamp': Timestamp.now(),
      'type': 'text',
    });

    final messageData = {
      'content': _controller.text.trim(),
      'senderId': AuthController.instance.userData.value.id,
      'timestamp': Timestamp.now(),
      'type': 'text',
    };

    FirebaseFirestore.instance.collection('chats').doc(widget.chatId).update({
      'lastMessage': messageData,
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          IconButton(
            onPressed: _sendMessage,
            icon: Icon(Icons.send, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
