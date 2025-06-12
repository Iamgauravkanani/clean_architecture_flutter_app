// Import necessary packages and files
import 'package:api_demo/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:api_demo/features/posts/data/repositories/post_repository_impl.dart';
import 'package:api_demo/features/posts/domain/repositories/post_repository.dart';
import 'package:api_demo/features/posts/domain/usecases/get_posts.dart';
import 'package:api_demo/features/posts/presentation/providers/post_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

/// GetIt instance for dependency injection
/// This is a singleton that will be used throughout the app
final sl = GetIt.instance;

/// Initialize all dependencies using GetIt
/// This function sets up the dependency injection container
/// following the clean architecture principles
Future<void> initDependencies() async {
  // Presentation Layer
  // Register the PostProvider as a factory
  // This means a new instance will be created each time it's requested
  sl.registerFactory(
    () => PostProvider(getPosts: sl()),
  );

  // Domain Layer
  // Register the GetPosts use case as a lazy singleton
  // This means only one instance will be created and reused
  sl.registerLazySingleton(() => GetPosts(sl()));

  // Data Layer
  // Register the PostRepository interface with its implementation
  // This follows the dependency inversion principle
  sl.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(remoteDataSource: sl()),
  );

  // Register the PostRemoteDataSource interface with its implementation
  sl.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSourceImpl(client: sl()),
  );

  // External Dependencies
  // Register the HTTP client as a lazy singleton
  // This ensures we're using the same HTTP client instance throughout the app
  sl.registerLazySingleton(() => http.Client());
} 