import 'package:public_api/core/services/api_service.dart';
import 'package:public_api/core/utils/constants/urls.dart';
import 'package:public_api/data/models/post.dart';

class PostDb {
  final ApiService _apiService = ApiService();
  Future postData() async {
    final data = await _apiService.fetchData(postUrl);
    return List<Post>.from(data.map((post) => Post.fromJson(post)));
  }
}
