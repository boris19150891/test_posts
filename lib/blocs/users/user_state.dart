import 'package:test_task_app/models/users_model.dart';

abstract class UserState {
  const UserState();
}
class BasicUsersState extends UserState{
  BasicUsersState();
}

class SuccessGetUsersState extends UserState{
  final UsersModel users;
  SuccessGetUsersState({this.users});
}