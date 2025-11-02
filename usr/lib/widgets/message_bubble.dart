import "package:flutter/material.dart";
import "package:couldai_user_app/models/message_model.dart";

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isSentByMe = message.isSentByMe;
    return Row(
      mainAxisAlignment:
          isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.6,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          margin: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: isSentByMe
                ? const Color(0xFF2B5278)
                : const Color(0xFF212D3B),
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(16),
              topRight: const Radius.circular(16),
              bottomLeft: isSentByMe ? const Radius.circular(16) : Radius.zero,
              bottomRight: isSentByMe ? Radius.zero : const Radius.circular(16),
            ),
          ),
          child: Text(
            message.text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
