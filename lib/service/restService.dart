import 'dart:convert';
import 'package:http/http.dart' as http;

class RestService{
  static String baseUrl = "https://jsonplaceholder.typicode.com/";
  static String posts = "${baseUrl}todos";

  static Future<List?> getPost() async {
    http.Response response = await http.get(Uri.parse(posts));
    if(response.statusCode == 200){
            List<dynamic> decodedData = jsonDecode(response.body);
            return decodedData;
     } else {
           return null;
     }
  }
}