import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_starting_project/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat_starting_project/constants.dart';

import '../components/messageBubble.dart';

class ChatScreen extends StatefulWidget {
  static const String id = "chat_screen";
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  TextEditingController _messageTextController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        automaticallyImplyLeading: false,
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
                AuthService().signOut();
                // messageStream();
              }),
        ],
        title: const Text('⚡ ️Chat'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(firestore: _firestore),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _messageTextController,
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _firestore.collection('messages').add({
                        'date': DateTime.now().microsecondsSinceEpoch,
                        'text': _messageTextController.text,
                        'sender': AuthService().getCurrentUser!.email,
                      });
                      _messageTextController.clear();
                    },
                    child: const Icon(Icons.send,
                        size: 30, color: kSendButtonColor),
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

class MessageStream extends StatelessWidget {
  const MessageStream({
    Key? key,
    required FirebaseFirestore firestore,
  })  : _firestore = firestore,
        super(key: key);

  final FirebaseFirestore _firestore;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').orderBy('date',descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Expanded(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
            ),
          );
        }
        if (snapshot.hasData) {
          var messages = snapshot.data!.docs;
          List<Widget> messageBubbles = [];
          for (var message in messages) {
            var messageText = message.get('text');
            var sender = message.get('sender');
            Widget messageBubble = MessageBubble(
                message: messageText,
                sender: sender,
                isMe: AuthService().getCurrentUser!.email == sender);
            messageBubbles.add(messageBubble);
          }
          return Expanded(
            child: ListView(
              reverse: true,
                children: messageBubbles),
          );
        } else {
          return Center(
            child: Text('snapshot has nodata'),
          );
        }
      },
    );
  }
}
