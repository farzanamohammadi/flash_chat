import 'package:flutter/material.dart';

import '../constants.dart';
class MessageBubble extends StatelessWidget {
  final String? message, sender;

  const MessageBubble({Key? key, this.message, this.sender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Material(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(BubbleRadius),
          topRight: Radius.circular(BubbleRadius),
          bottomLeft: Radius.circular(BubbleRadius),
          bottomRight: Radius.circular(BubbleRadius),
        ),
        color: Colors.blue,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Column(
              children: [
                Text(
                  sender!,
                  style: TextStyle(fontSize: 12,color: kChatEmailColor),
                ),
                SizedBox(height: 8,),
                Text(
                  message!,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            )),
      ),
    );
  }
}