import 'package:dio/dio.dart';
import 'package:test_task_app/models/users_model.dart';
import 'package:test_task_app/utils/static.dart';
import 'package:test_task_app/utils/api_path.dart';

class UserApi {
  final Dio _client = Static.dio();

  Future<UsersModel> getUserItem() async {
    final response = await _client.get(
      ApiPath.users,

    );

    if (response.data != null)
      return UsersModel.fromJson(response.data);
    else
      return UsersModel();
  }
}