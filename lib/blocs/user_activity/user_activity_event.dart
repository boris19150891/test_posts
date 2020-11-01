abstract class UserActivityEvent {
  const UserActivityEvent();
}

class BasicUserActivityEvent extends UserActivityEvent{
  BasicUserActivityEvent();
}

abstract class CommentsEvent {
  const CommentsEvent();
}

class BasicCommentsEvent extends CommentsEvent{
  BasicCommentsEvent();
}

abstract class PhotosEvent {
  const PhotosEvent();
}

class BasicPhotosEvent extends PhotosEvent{
  BasicPhotosEvent();
}