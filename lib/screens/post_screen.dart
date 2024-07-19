import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/post_table.dart';
import 'package:flutter_application_1/models/post.dart';
import 'package:flutter_application_1/daos/post_dao.dart';

class PostScreen extends StatefulWidget {
  @override
  State createState() {
    return _PostScreen();
  }
}

class _PostScreen extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: PostDao.getPosts(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Post>> asyncOfPosts) {
          return Scaffold(
            body: PostTable(asyncOfPosts.requireData),
          );
        });
  }
}
