import 'package:chat_app/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final ChatController controller = Get.find();
    final TextEditingController messageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Simple Chat'),
        actions: [
          Obx(
            () => Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Center(
                child: Text(
                  controller.lastSeen.value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  reverse: true,
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final message =
                        controller.messages.reversed.toList()[index];
                    final isMe = message['sender'] == controller.currentUser;

                    return Align(
                      alignment:
                          isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 14,
                        ),
                        decoration: BoxDecoration(
                          color: isMe ? Colors.blue[100] : Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isMe
                                  ? 'You'
                                  : (message['sender'] == 'userA'
                                      ? 'User A'
                                      : 'User B'),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:
                                    isMe ? Colors.blue[800] : Colors.grey[800],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(message['text']),
                            const SizedBox(height: 4),
                            Text(
                              DateFormat(
                                'HH:mm',
                              ).format(message['timestamp'].toDate()),
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 16,
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) {
                        controller.sendMessage(messageController.text);
                        messageController.clear();
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      controller.sendMessage(messageController.text);
                      messageController.clear();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
