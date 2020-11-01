import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test_task_app/blocs/user_activity/user_activity_event.dart';
import 'package:test_task_app/blocs/user_activity/user_activity_state.dart';
import 'package:test_task_app/models/activity/albums_model.dart';
import 'package:test_task_app/models/activity/comments_model.dart';
import 'package:test_task_app/models/activity/photos_model.dart';
import 'package:test_task_app/models/activity/posts_model.dart';
import 'package:test_task_app/repository/user_activity_repository.dart';

class UserActivityBlock extends Bloc<UserActivityEvent, UserActivityState> {

  UserActivityBlock() : super(BasicUserActivityState());

  final UserActivityRepository _userActivityRepository = UserActivityRepository();

  final _behaviorSubj = BehaviorSubject<List<PostsItemModel>>();
  final _behaviorSubjComments = BehaviorSubject<List<CommentsItemModel>>();
  final _behaviorSubjAlbums = BehaviorSubject<List<AlbumsItemModel>>();
  final _behaviorSubjPhotos = BehaviorSubject<List<PhotosItemModel>>();

  Sink<List<PostsItemModel>> get _inStream  => _behaviorSubj.sink;
  Stream<List<PostsItemModel>> get outStream  => _behaviorSubj.stream;

  Sink<List<CommentsItemModel>> get _inStreamComments  => _behaviorSubjComments.sink;
  Stream<List<CommentsItemModel>> get outStreamComments  => _behaviorSubjComments.stream;

  Sink<List<AlbumsItemModel>> get _inStreamAlbums  => _behaviorSubjAlbums.sink;
  Stream<List<AlbumsItemModel>> get outStreamAlbums  => _behaviorSubjAlbums.stream;

  Sink<List<PhotosItemModel>> get _inStreamPhotos  => _behaviorSubjPhotos.sink;
  Stream<List<PhotosItemModel>> get outStreamPhotos  => _behaviorSubjPhotos.stream;

  @override
  Stream<UserActivityState> mapEventToState(UserActivityEvent event) {
    throw UnimplementedError();
  }

  Future<void> getUserPosts(int idUser) async {
    var posts = await _userActivityRepository.getUserInfo();
    if(posts != null && posts.content != null) {
      var postUserById = posts.content.where((element) => element.userId == idUser).toList();

      if(postUserById != null && postUserById.isNotEmpty) {
        _inStream.add(postUserById);
      }
    }
  }

  Future<void> getComments(int postId) async {
    var comments = await _userActivityRepository.getCommentsInfo();
    if(comments != null && comments.content != null) {
      var commentsPostById = comments.content.where((element) => element.postID == postId).toList();

      if(commentsPostById != null && commentsPostById.isNotEmpty) {
        _inStreamComments.add(commentsPostById);
      }
    }
  }

  Future<void> getAlbums(int userId) async {
    var albums = await _userActivityRepository.getAlbumsInfo();
    if(albums != null && albums.content != null) {
      var albumsById = albums.content.where((element) => element.userId == userId).toList();

      if(albumsById != null && albumsById.isNotEmpty) {
        _inStreamAlbums.add(albumsById);
      }
    }
  }

  Future<void> getPhotos(int albumId) async {
    var photos = await _userActivityRepository.getPhotosInfo();
    if(photos != null && photos.content != null) {
      var photosByAlbumsId = photos.content.where((element) => element.albumId == albumId).toList();

      if(photosByAlbumsId != null && photosByAlbumsId.isNotEmpty) {
        _inStreamPhotos.add(photosByAlbumsId);
      }
    }
  }

}
