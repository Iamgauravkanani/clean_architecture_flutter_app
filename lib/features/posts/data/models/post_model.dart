import 'package:api_demo/features/posts/domain/entities/post.dart';

/// PostModel class
/// This is a data layer class that extends the Post entity
/// It adds functionality for JSON serialization/deserialization
/// This class is responsible for converting between JSON and Post objects
class PostModel extends Post {
  /// Constructor that passes all required fields to the parent Post class
  const PostModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.body,
  });

  /// Factory constructor that creates a PostModel from a JSON map
  /// This is used when deserializing data from the API
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }

  /// Converts the PostModel to a JSON map
  /// This is used when serializing data to send to the API
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
    };
  }
} 