import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_app/blocs/user_activity/user_activity_block.dart';
import 'package:test_task_app/models/activity/albums_model.dart';
import 'package:test_task_app/models/activity/photos_model.dart';
import 'package:test_task_app/models/activity/posts_model.dart';
import 'package:test_task_app/models/users_model.dart';
import 'package:test_task_app/screens/user_albums_screen.dart';
import 'package:test_task_app/screens/user_posts_screen.dart';
import 'package:test_task_app/widgets/profile_image.dart';

class UserPageScreen extends StatefulWidget {

  UserItemModel user;
  PostsModel posts;
  UserPageScreen({Key key, this.user, this.posts}) : super(key: key);

  @override
  _UserPageScreenState createState() => _UserPageScreenState();
}

class _UserPageScreenState extends State<UserPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.username,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocProvider(
          create: (_) => UserActivityBlock(),
          child: Builder(
              builder: (context) {
                context.bloc<UserActivityBlock>().getUserPosts(widget.user.id);
                context.bloc<UserActivityBlock>().getAlbums(widget.user.id);
                context.bloc<UserActivityBlock>().getPhotos(widget.user.id);
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              ProfileImage(),
                              Container(
                                  alignment: Alignment.center,
                                  width: 140,
                                  margin: EdgeInsets.all(8),
                                  child: Text('Image profile',
                                    style: TextStyle(color: Colors.grey),)
                              ),
                            ],
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.all(8),
                                    child: Text(widget.user.name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18.0),
                                    )
                                ),
                                Container(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  margin: EdgeInsets.all(8),
                                  child: RichText(
                                    text: TextSpan(
                                      style: DefaultTextStyle
                                          .of(context)
                                          .style,
                                      children: [
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.email, color: Colors.blue,
                                            size: 15,),
                                        ),
                                        TextSpan(
                                            text: ':  ${widget.user.email}'),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  margin: EdgeInsets.all(4),
                                  child: RichText(
                                    text: TextSpan(
                                      style: DefaultTextStyle
                                          .of(context)
                                          .style,
                                      children: [
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.phone, color: Colors.blue,
                                            size: 15,),
                                        ),
                                        TextSpan(
                                            text: ':  ${widget.user.phone}'),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  margin: EdgeInsets.all(4),
                                  child: RichText(
                                    text: TextSpan(
                                      style: DefaultTextStyle
                                          .of(context)
                                          .style,
                                      children: [
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.web, color: Colors.blue,
                                            size: 15,),
                                        ),
                                        TextSpan(
                                            text: ':  ${widget.user.website}'),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  margin: EdgeInsets.all(4),
                                  child: RichText(
                                    text: TextSpan(
                                      style: DefaultTextStyle
                                          .of(context)
                                          .style,
                                      children: [
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.work, color: Colors.blue,
                                            size: 15,),
                                        ),
                                        TextSpan(text: ' Company:  ${widget.user
                                            .company.name}'),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  margin: EdgeInsets.all(4),
                                  child: RichText(
                                    text: TextSpan(
                                      style: DefaultTextStyle
                                          .of(context)
                                          .style,
                                      children: [
                                        WidgetSpan(
                                          child: Icon(Icons.work_outline,
                                            color: Colors.blue, size: 15,),
                                        ),
                                        TextSpan(
                                            text: ' BS:  ${widget.user.company
                                                .bs}'),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  margin: EdgeInsets.all(4),
                                  child: RichText(
                                    text: TextSpan(
                                      style: DefaultTextStyle
                                          .of(context)
                                          .style,
                                      children: [
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.apartment, color: Colors.blue,
                                            size: 15,),
                                        ),
                                        TextSpan(text: ' : ${widget.user.address
                                            .street}, ${widget.user.address
                                            .suite}, ${widget.user.address
                                            .city}, '
                                            '${widget.user.address
                                            .zipcode}, ${widget.user.address.geo
                                            .lat}, ${widget.user.address.geo
                                            .lng}'
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  margin: EdgeInsets.all(4),
                                  child: Text(
                                    'Catch phrase: \u00A9 ${widget.user.company
                                        .catchPhrase}',
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.black54),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          StreamBuilder(
                            stream: context
                                .bloc<UserActivityBlock>()
                                .outStream,
                            builder: (context, sn) {
                              if (sn.data != null) {
                                return Container(
                                  child: _buildPosts(sn.data),
                                );
                              } else {
                                return Container();
                              }
                            },
                          )
                        ],
                      ),
                      Container(
                        child: StreamBuilder(
                          stream: context.bloc<UserActivityBlock>().outStreamAlbums,
                          builder: (context, sn) {
                            if (sn.data != null) {
                              return Container(
                                child: _buildAlbums(sn.data, context),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
          )
      ),
    );
  }

  Widget _buildPosts(List<PostsItemModel> list) {
    return RaisedButton(
      splashColor: Colors.blue,
      color: Colors.grey[50],
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserPostsScreen(posts: list)),
        );
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.lightBlue[50],
            ),
            child: ListTile(
              title: Text(
                  list[0].title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1
              ),
              subtitle: Text(
                list[0].body,
                maxLines: 1,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.yellow[100],
            ),
            child: ListTile(
              title: Text(
                  list[1].title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1
              ),
              subtitle: Text(
                list[1].body,
                maxLines: 1,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.orange[100],
            ),
            child: ListTile(
              title: Text(
                  list[2].title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1
              ),
              subtitle: Text(
                list[2].body,
                maxLines: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlbums(List<AlbumsItemModel> list, BuildContext context) {
    return StreamBuilder(
      stream: context.bloc<UserActivityBlock>().outStreamPhotos,
      builder: (context, sn) {
        if (sn.data != null) {
          return RaisedButton(
            splashColor: Colors.blue,
            color: Colors.grey[50],
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UserAlbumsScreen(albums: list, photos: sn.data,)),
              )
            },
            child: Container(
              margin: EdgeInsets.all(2.0),
              child: _buildPhotos(sn.data, list),
            ),
          );
        } else {
          return Center(
            child: SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
          );
        }
      },
    );
  }
  Widget _buildPhotos(List<PhotosItemModel> photoList, List<AlbumsItemModel> list) {
    return GridView.count(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.all(2.0),
              child: Image.network(photoList[0].thumbnailUrl),
            ),
            Text('\n ${list[0].title}',
              textAlign: TextAlign.center,),
          ],
        ),
        Stack(
          children: [
            Container(
              margin: EdgeInsets.all(2.0),
              child: Image.network(photoList[1].thumbnailUrl),
            ),
            Text('\n ${list[1].title}',
              textAlign: TextAlign.center,),
          ],
        ),
        Stack(
          children: [
            Container(
              margin: EdgeInsets.all(2.0),
              child: Image.network(photoList[2].thumbnailUrl),
            ),
            Text('\n ${list[2].title}',
              textAlign: TextAlign.center,),
          ],
        ),
      ],
    );
  }
}