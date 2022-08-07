import 'dart:convert';
import 'dart:developer';

import 'package:mvvm_provider_practice/model/post.dart';

import '../utils/api_constants.dart';
import '../services/base_service.dart';
import '../services/api_service.dart';

class ApiRepository {
  final BaseService _apiService = ApiService();

  Future<List<Post>> fetchPostList() async {
    dynamic response = await _apiService.getGetResponse(ApiConstants.postList);
    List<Post> postList = [];
    response.forEach((v) {
      postList.add(Post.fromJson(v));
    });
    return postList;
  }
}