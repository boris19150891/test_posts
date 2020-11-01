import 'package:flutter/material.dart';
import 'package:test_task_app/models/activity/posts_model.dart';
import 'package:test_task_app/screens/post_page_screen.dart';

class UserPostsScreen extends StatefulWidget{

  List<PostsItemModel> posts;

  UserPostsScreen({Key key, this.posts}) : super(key: key);

  @override
  _UserPostsScreenState createState() => _UserPostsScreenState();
}

class _UserPostsScreenState extends State<UserPostsScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post list',
          style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      body: ListView.builder(
          itemCount: widget.posts.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: RaisedButton(
                    color: Colors.white,
                    splashColor: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                          context,
                        MaterialPageRoute(builder: (context) => PostPageScreen(post: widget.posts[index],)),
                      );
                    },
                    child: ListTile(
                      leading: Icon(Icons.post_add, color: Colors.blue, size: 40,),
                      title: Text(widget.posts[index].title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 1
                      ),
                      subtitle: Text(widget.posts[index].body,
                      maxLines: 1,
                    ),
                    ),
                  ),
                ),
              ],
            );
          }
      ),
    );
  }
}