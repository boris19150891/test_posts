import 'package:flutter/material.dart';
import 'package:test_task_app/models/activity/albums_model.dart';
import 'package:test_task_app/models/activity/photos_model.dart';

class AlbumPageScreen extends StatefulWidget {

  List<AlbumsItemModel> albums;
  List<PhotosItemModel> photos;
  AlbumPageScreen({Key key, this.albums, this.photos}) : super(key: key);

  @override
  _AlbumPageScreenState createState() => _AlbumPageScreenState();
}

class _AlbumPageScreenState extends State<AlbumPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.albums.first.title,
          style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      body: Center(
        child: Container(
          width: 350,
          height: 350,
          alignment: Alignment.center,
          margin: EdgeInsets.all(2.0),
          child: Image.network(widget.photos.first.url),
        ),
      ),
    );
  }
}
