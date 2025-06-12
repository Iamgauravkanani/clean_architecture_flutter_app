/// Post entity class
/// This is a core business object that represents a post in the application
/// It is part of the domain layer and is independent of any data source
/// This class should contain only the essential business logic and data
class Post {
  /// Unique identifier for the post
  final int id;

  /// ID of the user who created the post
  final int userId;

  /// Title of the post
  final String title;

  /// Content/body of the post
  final String body;

  /// Constructor for creating a Post instance
  /// All fields are required and immutable (final)
  const Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });
} 