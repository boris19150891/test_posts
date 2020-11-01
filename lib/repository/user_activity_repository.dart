import 'package:test_task_app/datasources/api/user_activity_api.dart';
import 'package:test_task_app/models/activity/albums_model.dart';
import 'package:test_task_app/models/activity/comments_model.dart';
import 'package:test_task_app/models/activity/photos_model.dart';
import 'package:test_task_app/models/activity/posts_model.dart';

class UserActivityRepository {
  final UserActivityApi _userActivityApi = UserActivityApi();

  Future<PostsModel> getUserInfo() {
    return _userActivityApi.getUserInfo();
  }

  Future<CommentsModel> getCommentsInfo() {
    return _userActivityApi.getComments();
  }

  Future<AlbumsModel> getAlbumsInfo() {
    return _userActivityApi.getAlbums();
  }

  Future<PhotosModel> getPhotosInfo() {
    return _userActivityApi.getPhotos();
  }
}
