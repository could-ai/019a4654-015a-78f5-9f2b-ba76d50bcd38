import "package:flutter/material.dart";
import "package:couldai_user_app/models/chat_model.dart";
import "package:couldai_user_app/models/message_model.dart";
import "package:couldai_user_app/widgets/message_bubble.dart";

class ChatView extends StatefulWidget {
  final Chat chat;

  const ChatView({super.key, required this.chat});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      widget.chat.messages.add(Message(
        text: _messageController.text.trim(),
        isSentByMe: true,
        timestamp: "Now",
      ));
      _messageController.clear();
    });

    // Scroll to the bottom after sending a message
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Chat Header
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          color: const Color(0xFF212D3B),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.chat.avatarUrl),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.chat.userName,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const Text("online",
                        style: TextStyle(fontSize: 13, color: Colors.grey)),
                  ],
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
            ],
          ),
        ),
        // Messages Area
        Expanded(
          child: Container(
            color: const Color(0xFF18222D),
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(10),
              itemCount: widget.chat.messages.length,
              itemBuilder: (context, index) {
                final message = widget.chat.messages[index];
                return MessageBubble(message: message);
              },
            ),
          ),
        ),
        // Message Input
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          color: const Color(0xFF212D3B),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.attach_file, color: Colors.grey[500]),
              ),
              Expanded(
                child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: "Message",
                    border: InputBorder.none,
                    filled: true,
                    fillColor: const Color(0xFF18222D),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  ),
                  onSubmitted: (value) => _sendMessage(),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.mic, color: Colors.grey[500]),
              ),
              IconButton(
                onPressed: _sendMessage,
                icon: const Icon(Icons.send, color: Color(0xFF5288C1)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
