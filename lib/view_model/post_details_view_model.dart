import 'package:flutter/material.dart';

import '../model/post.dart';

class PostDetailsViewModel with ChangeNotifier {
  Post aPost = Post();

  setPostData(Post post) {
    aPost = post;
    notifyListeners();
  }
}
