import 'package:api_demo/features/posts/domain/entities/post.dart';
import 'package:api_demo/features/posts/domain/usecases/get_posts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for managing posts state
/// This provider is used by the UI to access and update the posts state
final postsProvider = StateNotifierProvider<PostProvider, AsyncValue<List<Post>>>((ref) {
  return PostProvider(getPosts: ref.watch(getPostsProvider));
});

/// Provider for the GetPosts use case
/// This provider is used to access the use case from the UI
final getPostsProvider = Provider<GetPosts>((ref) {
  return GetPosts(ref.watch(postRepositoryProvider));
});

/// Provider for the PostRepository interface
/// This provider is used to access the repository from the use case
final postRepositoryProvider = Provider((ref) {
  return ref.watch(postRepositoryImplProvider);
});

/// Provider for the PostRepository implementation
/// This provider is used to create the repository instance
final postRepositoryImplProvider = Provider((ref) {
  return ref.watch(postRepositoryImplProvider);
});

/// StateNotifier for managing posts state
/// This class is responsible for updating the posts state
/// and handling loading and error states
class PostProvider extends StateNotifier<AsyncValue<List<Post>>> {
  /// Use case for getting posts
  final GetPosts getPosts;

  /// Constructor that requires a GetPosts use case
  /// Initializes the state as loading
  PostProvider({required this.getPosts}) : super(const AsyncValue.loading()) {
    fetchPosts();
  }

  /// Fetches posts from the API
  /// Updates the state with loading, data, or error
  Future<void> fetchPosts() async {
    try {
      // Set loading state
      state = const AsyncValue.loading();
      // Fetch posts using the use case
      final posts = await getPosts();
      // Update state with the fetched posts
      state = AsyncValue.data(posts);
    } catch (e, stack) {
      // Update state with the error
      state = AsyncValue.error(e, stack);
    }
  }
} 