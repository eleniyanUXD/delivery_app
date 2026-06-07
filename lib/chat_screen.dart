import 'package:delivery_app/widgets/chat_input_field.dart';
import 'package:delivery_app/widgets/chat_profile_card.dart';
import 'package:delivery_app/widgets/message_list.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();

  void openAttachmentSheet() {
    print("Attachment button clicked");
  }

  void sendMessage() {
    if (messageController.text.isEmpty) return;

    FirebaseFirestore.instance.collection('messages').add({
      'text': messageController.text,
      'sender': 'User1',
      'timestamp': FieldValue.serverTimestamp(),
    });

    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Chat with Support',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            child: ChatProfileCard(
              title: 'Abdulrauf Fuad',
              subtitle: 'Online',
              imagePath: 'assets/images/avatar.png',
              onTap: () {},
            ),
          ),

          const SizedBox(height: 10),

          // 💬 Messages
          Expanded(
            child: MessageList(
              stream: FirebaseFirestore.instance
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
            ),
          ),

          // ✍️ Input
          Padding(
            padding: const EdgeInsets.all(8),
            child: ChatInputField(
              controller: messageController,
              onSend: sendMessage,
              onAdd: openAttachmentSheet,
            ),
          ),
        ],
      ),
    );
  }
}
