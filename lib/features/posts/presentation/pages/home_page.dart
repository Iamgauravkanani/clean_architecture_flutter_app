import 'package:api_demo/features/posts/presentation/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Home page of the application
/// This page displays a list of posts fetched from the API
/// It uses Riverpod for state management
class HomePage extends ConsumerWidget {
  /// Constructor
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the posts provider to rebuild when the state changes
    final postsAsync = ref.watch(postsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      // Use when to handle different states of the async value
      body: postsAsync.when(
        // When data is available, display the list of posts
        data: (posts) => ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
              ),
            );
          },
        ),
        // When loading, show a progress indicator
        loading: () => const Center(child: CircularProgressIndicator()),
        // When there's an error, show the error message
        error: (error, stack) => Center(
          child: Text('Error: ${error.toString()}'),
        ),
      ),
    );
  }
} 