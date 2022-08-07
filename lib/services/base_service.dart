abstract class BaseService {
  // final String baseUrl = "https://itunes.apple.com/search?term=";

  Future<dynamic> getGetResponse(String url);

  Future<dynamic> getPostResponse(String url, data);

}