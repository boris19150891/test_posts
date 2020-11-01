import 'package:dio/dio.dart';
import 'package:test_task_app/models/activity/albums_model.dart';
import 'package:test_task_app/models/activity/comments_model.dart';
import 'package:test_task_app/models/activity/photos_model.dart';
import 'package:test_task_app/models/activity/posts_model.dart';
import 'package:test_task_app/utils/static.dart';
import 'package:test_task_app/utils/api_path.dart';

class UserActivityApi {
  final Dio _client = Static.dio();

  Future<PostsModel> getUserInfo() async {
    final response = await _client.get(
      ApiPath.userActivity,

    );
    if (response.data != null)
      return PostsModel.fromJson(response.data);
    else
      return PostsModel();
  }

  Future<CommentsModel> getComments() async {
    final comment = await _client.get(
      ApiPath.comments,

    );

    if (comment.data != null)
      return CommentsModel.fromJson(comment.data);
    else
      return CommentsModel();
  }

  Future<AlbumsModel> getAlbums() async {
    final album = await _client.get(
      ApiPath.albums,

    );

    if (album.data != null)
      return AlbumsModel.fromJson(album.data);
    else
      return AlbumsModel();
  }

  Future<PhotosModel> getPhotos() async {
    final album = await _client.get(
      ApiPath.photos,

    );

    if (album.data != null)
      return PhotosModel.fromJson(album.data);
    else
      return PhotosModel();
  }
}
