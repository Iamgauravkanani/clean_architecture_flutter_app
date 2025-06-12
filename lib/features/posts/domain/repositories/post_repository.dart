import 'package:api_demo/features/posts/domain/entities/post.dart';

/// Abstract class defining the contract for post repository operations
/// This is part of the domain layer and defines the interface that
/// the data layer must implement
/// This follows the dependency inversion principle
abstract class PostRepository {
  /// Fetches a list of posts
  /// This method is used by the domain layer to get posts
  /// The implementation details are hidden from the domain layer
  Future<List<Post>> getPosts();
} 