import 'package:flutter/material.dart';
import 'package:public_api/api/api_service.dart';

class PostScreen extends StatelessWidget {
  PostScreen({super.key});

  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts API'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final data = await apiService.getPosts();
            print('### ${data.length}');
          },
          child: const Text('Get Post'),
        ),
      ),
    );
  }
}
