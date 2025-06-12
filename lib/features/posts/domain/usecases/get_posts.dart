import 'package:api_demo/features/posts/domain/entities/post.dart';
import 'package:api_demo/features/posts/domain/repositories/post_repository.dart';

/// Use case for getting posts
/// This class encapsulates the business logic for fetching posts
/// It is part of the domain layer and uses the repository interface
class GetPosts {
  /// Repository for accessing post data
  final PostRepository repository;

  /// Constructor that requires a repository
  GetPosts(this.repository);

  /// Call method that executes the use case
  /// This method is called by the presentation layer
  /// to fetch posts
  Future<List<Post>> call() async {
    return await repository.getPosts();
  }
} 