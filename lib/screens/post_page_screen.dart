import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_app/blocs/user_activity/user_activity_block.dart';
import 'package:test_task_app/models/activity/comments_model.dart';
import 'package:test_task_app/models/activity/posts_model.dart';
import 'add_comment_screen.dart';

class PostPageScreen extends StatefulWidget {

  PostsItemModel post;
  PostPageScreen({Key key, this.post}) : super(key: key);

  @override
  _PostPageScreenState createState() => _PostPageScreenState();
}

class _PostPageScreenState extends State<PostPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post activity',
          style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      body: BlocProvider(
        create: (_) => UserActivityBlock(),
        child: Builder(
            builder: (context) {
              context.bloc<UserActivityBlock>().getComments(widget.post.id);
              return Container(
                  child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 15, right: 5, left: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            color: Colors.orange[100],
                          ),
                          child: Text(widget.post.title,
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 2.0, right: 5, left: 5, bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            color: Colors.yellow[100],
                          ),
                          child: Text(widget.post.body,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        StreamBuilder(
                          stream: context.bloc<UserActivityBlock>().outStreamComments,
                          builder: (context, sn) {
                            if(sn != null && sn.data != null) {
                              return _buildComments(sn.data);
                            } else {
                              return Container();
                            }
                          },
                        ),
                        RaisedButton(
                          color: Colors.white,
                          splashColor: Colors.blue,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AddCommentScreen()),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 250,
                            child: Text('Add comment',
                              style: TextStyle(color: Colors.blue),),
                          ),
                        ),
                      ]
                  )
              );
            }
        ),
      ),
    );
  }

  Widget _buildComments(List<CommentsItemModel> comments) {
    return Expanded(
      child: ListView.builder(
          itemCount: comments.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.lightBlue[50],
                  ),
                  margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.person, color: Colors.blue, size: 15,),
                        ),
                        TextSpan(text: '  ${comments[index].name}',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Colors.lightBlue[50],
                  ),
                  margin: EdgeInsets.only(left: 5, right: 5),
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.email, color: Colors.blue, size: 15,),
                        ),
                        TextSpan(text: '  ${comments[index].email}',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    comments[index].name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(comments[index].body),
                ),
              ],
            );
          }
      ),
    );
  }

}
