import 'package:flutter/material.dart';
import 'package:mvvm_provider_practice/view_model/post_list_view_model.dart';
import 'widgets/post_item.dart';
import 'package:provider/provider.dart';

class PostListScreen extends StatefulWidget {
  @override
  _PostListScreenState createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  late PostListViewModel _postListViewModel;

  @override
  void initState() {
    _postListViewModel = Provider.of<PostListViewModel>(context, listen: false);
    _postListViewModel.fetchMediaData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PostListViewModel>(
      create: (BuildContext context) => _postListViewModel,
      child: Consumer<PostListViewModel>(
        builder: (context, postListViewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('MVVM with Provider'),
            ),
            body: postListViewModel.postList.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: postListViewModel.postList.length,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (BuildContext context, int index) {
                      return PostItem(aPost: postListViewModel.postList[index]);
                    },
                  ),
          );
        },
      ),
    );
  }
}
