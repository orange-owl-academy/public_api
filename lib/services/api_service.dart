import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:public_api/models/post.dart';

class ApiService {
  static const _url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> getPosts() async {
    //* STEP 01 : SEND REQUEST AND ACCEPT RESPONSE
    final response = await http.get(Uri.parse(_url));

    //* STEP 02 : VALIDATE RESPONSE AND DECODE JSON
    if (response.statusCode == 200) {
      return List<Post>.from(json.decode(response.body).map((post) => Post.fromJson(post)));
    } else {
      throw Exception('Failed to fetch posts');
    }
  }
}
