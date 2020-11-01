import 'package:test_task_app/models/users_model.dart';

abstract class UserEvent {
  const UserEvent();
}
class BasicUsersEvent extends UserEvent{
  BasicUsersEvent();
}

class SuccessGetUsersEvent extends UserEvent{
  final UsersModel users;
  SuccessGetUsersEvent({this.users});
}