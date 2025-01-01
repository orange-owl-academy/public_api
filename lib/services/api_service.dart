import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:public_api/models/post.dart';
import 'package:public_api/models/post_response.dart';

class ApiService {
  static const _url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> getPosts() async {
    //* STEP 01 : SEND REQUEST AND ACCEPT RESPONSE
    final response = await http.get(Uri.parse(_url));

    //* STEP 02 : VALIDATE RESPONSE AND DECODE JSON
    if (response.statusCode == 200) {
      return List<Post>.from(
        json.decode(response.body).map(
              (post) => Post.fromJson(post),
            ),
      );
    } else {
      throw Exception('Failed to fetch posts');
    }
  }

  Future<PostResponse> postData(
      String fullName, String email, String number, String password) async {
    // Map<String, String> header = {'toker': "hdjkashdhjdguiacvgdahjdhabkdvbhak"};

    // Map<String, String> body = {
    //   "name": fullName,
    //   "email": email,
    //   "number": number,
    //   "password": password,
    // };
    Map<String, dynamic> body = {
      "title": 'foo',
      "body": 'bar',
      "userId": "1"
    };
    /*
    {
    title: 'foo',
    body: 'bar',
    userId: 1,
    }
     */
    final response = await http.post(Uri.parse(_url), body: body);
    print(response.statusCode);
    if (response.statusCode == 201) {
      return PostResponse.fromJson( json.decode(response.body));
    } else {
      throw Exception('Failed to fetch posts');
    }
  }
}
