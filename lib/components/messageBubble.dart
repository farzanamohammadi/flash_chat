import 'package:flutter/material.dart';

import '../constants.dart';

class MessageBubble extends StatelessWidget {
  final String? message, sender;
  final bool isMe;

  const MessageBubble({Key? key, this.message, this.sender, required this.isMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8),
        child: Align(
          alignment: isMe!?Alignment.centerRight:Alignment.bottomLeft,
          child: Material(
            borderRadius: BorderRadius.only(
              topLeft:isMe!? Radius.circular(BubbleRadius):Radius.circular(0),
              topRight: isMe!?Radius.circular(0):Radius.circular(BubbleRadius),
              bottomLeft: Radius.circular(BubbleRadius),
              bottomRight: Radius.circular(BubbleRadius),
            ),
            color: isMe! ? kSendButtonColor : kSenderBoxColor,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                child: Column(
                  crossAxisAlignment: isMe!?CrossAxisAlignment.end:CrossAxisAlignment.start,
                  children: [
                    Text(
                      sender!,
                      style: TextStyle(fontSize: 12, color: kChatEmailColor),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      message!,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                )),
          ),
        ));
  }
}
