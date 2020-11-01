
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test_task_app/models/users_model.dart';
import 'package:test_task_app/repository/user_repository.dart';

import 'user_event.dart';
import 'user_state.dart';

class UserBlock extends Bloc<UserEvent, UserState> {

  UserBlock() : super(BasicUsersState()) {
    getUserInfo();
  }

  final _behaviorSubj = BehaviorSubject<UsersModel>();

  Sink<UsersModel> get _inStream  => _behaviorSubj.sink;
  Stream<UsersModel> get outStream  => _behaviorSubj.stream;

  UsersModel users;
  final UserRepository userRepository = UserRepository();

  @override
  Stream<UserState> mapEventToState(UserEvent event) {

    throw UnimplementedError();
  }

  Future<void> getUserInfo() async {
    var userszs  = await userRepository.getUserInfo();
    if(userszs != null && userszs.content != null && userszs.content.isNotEmpty)
      _inStream.add(userszs);
  }

}
