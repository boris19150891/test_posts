import 'package:test_task_app/datasources/api/user_api.dart';
import 'package:test_task_app/models/users_model.dart';

class UserRepository {
  final UserApi _userApi = UserApi();

  Future<UsersModel> getUserInfo() {
    return _userApi.getUserItem();
  }
}