import 'package:api_demo/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:api_demo/features/posts/domain/entities/post.dart';
import 'package:api_demo/features/posts/domain/repositories/post_repository.dart';

/// Implementation of the PostRepository interface
/// This class is responsible for coordinating data operations
/// and converting between data models and domain entities
class PostRepositoryImpl implements PostRepository {
  /// Remote data source for fetching posts from the API
  final PostRemoteDataSource remoteDataSource;

  /// Constructor that requires a remote data source
  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Post>> getPosts() async {
    // Use the remote data source to fetch posts
    // The data source returns PostModel objects which are also Post entities
    // due to inheritance, so we can return them directly
    return await remoteDataSource.getPosts();
  }
} 