import "package:flutter/material.dart";
import "package:couldai_user_app/models/chat_model.dart";
import "package:couldai_user_app/widgets/chat_list.dart";
import "package:couldai_user_app/widgets/chat_view.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Chat? _selectedChat;

  // Mock data for demonstration
  final List<Chat> _chats = Chat.mockChats;

  void _onChatSelected(Chat chat) {
    setState(() {
      _selectedChat = chat;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left panel: Chat list
          Container(
            width: 320,
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(color: Colors.black26, width: 1.0),
              ),
            ),
            child: ChatList(
              chats: _chats,
              onChatSelected: _onChatSelected,
              selectedChat: _selectedChat,
            ),
          ),
          // Right panel: Chat view
          Expanded(
            child: _selectedChat != null
                ? ChatView(chat: _selectedChat!)
                : const Center(
                    child: Text(
                      "Select a chat to start messaging",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
