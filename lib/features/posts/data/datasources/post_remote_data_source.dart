import 'dart:convert';
import 'package:api_demo/features/posts/data/models/post_model.dart';
import 'package:http/http.dart' as http;

/// Abstract class defining the contract for post data operations
/// This follows the interface segregation principle
abstract class PostRemoteDataSource {
  /// Fetches a list of posts from the remote API
  Future<List<PostModel>> getPosts();
}

/// Implementation of the PostRemoteDataSource
/// This class is responsible for making HTTP requests to the API
/// and converting the responses to PostModel objects
class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  /// HTTP client for making API requests
  final http.Client client;

  /// Constructor that requires an HTTP client
  PostRemoteDataSourceImpl({required this.client});

  @override
  Future<List<PostModel>> getPosts() async {
    // Make HTTP GET request to the API endpoint
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    // Check if the request was successful
    if (response.statusCode == 200) {
      // Parse the JSON response
      final List<dynamic> jsonList = json.decode(response.body);
      // Convert each JSON object to a PostModel
      return jsonList.map((json) => PostModel.fromJson(json)).toList();
    } else {
      // Throw an exception if the request failed
      throw Exception('Failed to load posts');
    }
  }
} 