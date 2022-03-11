import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:tutorial6/http_service.dart';

import 'post_model.dart';

class PostPage extends StatelessWidget {
  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post> posts = snapshot.data;
            return ListView(
              children: posts.map((Post post) => ListTile(
                title: Text(post.title),
                subtitle: Text(post.id.toString(),),
                onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> )
                ),
              )
              ).toList(),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
