import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/post.dart';
import '../view_model/post_details_view_model.dart';

class PostDetailsScreen extends StatefulWidget {
  final Post? aPost;
  const PostDetailsScreen({Key? key, this.aPost})
      : super(key: key);

  @override
  State createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {

  final PostDetailsViewModel  _postDetailsViewModel = PostDetailsViewModel();

  @override
  void initState() {
    _postDetailsViewModel.setPostData(widget.aPost!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PostDetailsViewModel>(
      create: (BuildContext context) => _postDetailsViewModel,
      child: Consumer<PostDetailsViewModel>(
        builder: (context, postDetailsViewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Post Details'),
            ),
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(postDetailsViewModel.aPost.title!,
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87)),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(postDetailsViewModel.aPost.body!,
                        textAlign: TextAlign.justify,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                            fontSize: 16, color: Color(0xff8a8989))),
                  ],
                ),
              ),
            )
          );
        },
      ),
    );
  }
}
