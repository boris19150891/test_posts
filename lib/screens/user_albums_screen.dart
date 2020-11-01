import 'package:flutter/material.dart';
import 'package:test_task_app/models/activity/albums_model.dart';
import 'package:test_task_app/models/activity/photos_model.dart';

import 'album_page_screen.dart';

class UserAlbumsScreen extends StatefulWidget{

  List<AlbumsItemModel> albums;
  List<PhotosItemModel> photos;
  UserAlbumsScreen({Key key, this.albums, this.photos}) : super(key: key);

  @override
  _UserAlbumsScreenState createState() => _UserAlbumsScreenState();
}

class _UserAlbumsScreenState extends State<UserAlbumsScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums list',
          style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      body: ListView.builder(
          itemCount: widget.albums.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(
                  child: RaisedButton(
                    color: Colors.white,
                    splashColor: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AlbumPageScreen(photos: widget.photos, albums: widget.albums,)),
                      );
                    },
                    child: GridView.count(
                      shrinkWrap: true,
                      primary: false,
                      padding: const EdgeInsets.all(10),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: [
                        Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.all(2.0),
                              child: Image.network(widget.photos[index].thumbnailUrl),
                            ),
                            Text('\n ${widget.albums[index].title}',
                              textAlign: TextAlign.center,),
                          ],
                        ),
                      ],
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