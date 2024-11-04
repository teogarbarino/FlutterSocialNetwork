import 'user.dart';

class Post {
  final String id; // Assuming your backend provides an ID for each post
  final User author;
  final String title;
  final String description;
  final DateTime createdAt;
  final String image; // nullable to handle optional image
  final List<Message> messages;

  Post({
    required this.id,
    required this.author,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.image,
    required this.messages,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json['_id'] ?? json['id'], // Handle potential variations in ID key
        author: User.fromJson(json['author']),
        title: json['title'],
        description: json['description'],
        createdAt: DateTime.parse(
            json['createdAt']), // Assuming backend sends ISO 8601 format
        image: json['image'] ?? "",
        messages: (json['messages'] as List)
            .map((message) => Message.fromJson(message))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'author': author,
        'title': title,
        'description': description,
        'createdAt': createdAt.toIso8601String(),
        'image': image,
        'messages': messages.map((message) => message.toJson()).toList(),
      };
}

class Message {
  final String? content;
  final DateTime? sentAt;
  final User author;

  Message({
    required this.content,
    required this.sentAt,
    required this.author,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        author: User.fromJson(json['author']),
        content: json['content'],
        sentAt: DateTime.parse(
            json['sentAt']), // Assuming backend sends ISO 8601 format
      );

  Map<String, dynamic> toJson() => {
        'content': content,
        'sentAt': sentAt!.toIso8601String(),
        'auhthor': author,
      };
}
