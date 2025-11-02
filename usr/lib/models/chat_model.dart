import "package:couldai_user_app/models/message_model.dart";

class Chat {
  final String id;
  final String userName;
  final String avatarUrl;
  final String lastMessage;
  final String lastMessageTime;
  final List<Message> messages;

  Chat({
    required this.id,
    required this.userName,
    required this.avatarUrl,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.messages,
  });

  static final List<Chat> mockChats = [
    Chat(
      id: "1",
      userName: "Alice",
      avatarUrl: "https://i.pravatar.cc/150?u=alice",
      lastMessage: "Hey, how are you?",
      lastMessageTime: "18:32",
      messages: [
        Message(text: "Hi!", isSentByMe: false, timestamp: "18:30"),
        Message(text: "Hey, how are you?", isSentByMe: true, timestamp: "18:32"),
      ],
    ),
    Chat(
      id: "2",
      userName: "Bob",
      avatarUrl: "https://i.pravatar.cc/150?u=bob",
      lastMessage: "See you tomorrow!",
      lastMessageTime: "17:15",
      messages: [
        Message(text: "Let's meet up.", isSentByMe: false, timestamp: "17:10"),
        Message(text: "Sure, where?", isSentByMe: true, timestamp: "17:12"),
        Message(text: "The usual place.", isSentByMe: false, timestamp: "17:13"),
        Message(text: "See you tomorrow!", isSentByMe: true, timestamp: "17:15"),
      ],
    ),
    Chat(
      id: "3",
      userName: "Charlie",
      avatarUrl: "https://i.pravatar.cc/150?u=charlie",
      lastMessage: "Thanks!",
      lastMessageTime: "14:55",
      messages: [
        Message(text: "Here is the file.", isSentByMe: true, timestamp: "14:54"),
        Message(text: "Thanks!", isSentByMe: false, timestamp: "14:55"),
      ],
    ),
     Chat(
      id: "4",
      userName: "David",
      avatarUrl: "https://i.pravatar.cc/150?u=david",
      lastMessage: "Flutter is awesome!",
      lastMessageTime: "11:20",
      messages: [
        Message(text: "Have you tried the new Flutter update?", isSentByMe: false, timestamp: "11:18"),
        Message(text: "Not yet, is it good?", isSentByMe: true, timestamp: "11:19"),
        Message(text: "Flutter is awesome!", isSentByMe: false, timestamp: "11:20"),
      ],
    ),
  ];
}
