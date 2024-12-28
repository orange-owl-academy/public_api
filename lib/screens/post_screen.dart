import 'package:flutter/material.dart';
import 'package:public_api/api/api_service.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final ApiService apiService = ApiService();
  var result = [];
  var isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
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
        title: const Text('Posts API'),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: result.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(result[index].title),
                subtitle: Text(
                  result[index].body,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
    );
  }
}
