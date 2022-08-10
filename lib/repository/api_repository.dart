import '../model/post.dart';
import '../services/api_service.dart';
import '../services/base_service.dart';
import '../utils/api_constants.dart';

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