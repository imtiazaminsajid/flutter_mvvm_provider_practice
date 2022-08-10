import 'dart:developer';

import 'package:flutter/material.dart';

import '../model/post.dart';
import '../repository/api_repository.dart';

class PostListViewModel with ChangeNotifier {
  List<Post> postList = [];

  Future<void> fetchMediaData() async {
    try {
      postList = await ApiRepository().fetchPostList();
      // notifyListeners(); this call will occur to notify ui twice,
      // since the bottom one will be called anyway 
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

}
