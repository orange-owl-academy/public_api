import 'package:flutter/material.dart';
import 'package:public_api/models/post.dart';
import 'package:public_api/services/api_service.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final ApiService apiService = ApiService();
  List<Post> result = [];
  bool isLoading = true;

  @override
  void initState() {
    //* Initial State
    super.initState();
    _loadPosts();
  }

  void _loadPosts() async {
    result = await apiService.getPosts();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: result.length,
              itemBuilder: (context, index) => ListTile(
                leading: Text("${result[index].id}"),
                title: Text(result[index].title!),
                subtitle: Text(result[index].body!),
              ),
            ),
    );
  }
}
