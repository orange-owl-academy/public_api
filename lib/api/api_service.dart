import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:public_api/models/post.dart';

class ApiService {
  Future<List<Post>> getPosts() async {
    const String url = 'https://jsonplaceholder.typicode.com/posts';
    try {
      //* step 1: Fetch Data from API
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        //* step 2: decode the json
        var data = json.decode(response.body) as List;
        print('### data -> $data');

        //* step 3: convert JSON to List<Post>
        final list = data.map((json) => Post.fromJson(json)).toList();
        return list;
      } else {
        throw Exception('Failed to load posts');
      }
    } on Exception catch (e) {
      throw Exception('Error: $e');
    }
  }
}
