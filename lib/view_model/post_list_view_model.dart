import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mvvm_provider_practice/model/post.dart';
import 'package:mvvm_provider_practice/repository/api_repository.dart';

class PostListViewModel with ChangeNotifier {
  List<Post> postList = [];

  Future<void> fetchMediaData() async {
    try {
      postList = await ApiRepository().fetchPostList();
      // notifyListeners(); this call will occur to notifiy ui twice,
      // since the bottom one will be called anyway 
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

}
