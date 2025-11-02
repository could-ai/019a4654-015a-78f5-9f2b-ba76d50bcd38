import "package:flutter/material.dart";
import "package:couldai_user_app/models/chat_model.dart";
import "package:couldai_user_app/widgets/chat_list_item.dart";

class ChatList extends StatelessWidget {
  final List<Chat> chats;
  final Function(Chat) onChatSelected;
  final Chat? selectedChat;

  const ChatList({
    super.key,
    required this.chats,
    required this.onChatSelected,
    this.selectedChat,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search bar
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search",
              hintStyle: TextStyle(color: Colors.grey[600]),
              prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
              filled: true,
              fillColor: const Color(0xFF242F3D),
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        // Chat list
        Expanded(
          child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              final chat = chats[index];
              return ChatListItem(
                chat: chat,
                isSelected: chat.id == selectedChat?.id,
                onTap: () => onChatSelected(chat),
              );
            },
          ),
        ),
      ],
    );
  }
}
