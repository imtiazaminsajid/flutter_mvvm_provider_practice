import 'package:flutter/material.dart';
import 'package:mvvm_provider_practice/model/post.dart';

class PostDetailsViewModel with ChangeNotifier {
  Post aPost = Post();

  setPostData(Post post) {
    aPost = post;
    notifyListeners();
  }
}
