import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_app/blocs/users/user_block.dart';
import 'package:test_task_app/models/users_model.dart';
import 'package:test_task_app/screens/user_list_screen.dart';

import 'blocs/users/user_state.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Users',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Users Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserBlock(),
      child: Builder(
        builder: (context) {
          return BlocListener<UserBlock, UserState>(
              listener: (_, state) {
                // todo используем stream builder
              },
              child: StreamBuilder<UsersModel>(
                stream: context.bloc<UserBlock>().outStream ,
                builder: (context, sn) {
                  if(sn.hasData && sn.data != null && sn.data.content != null) {
                    return UserListScreen(users: sn.data,);
                  } else {
                    return Center(
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    );
                  }
                },
              ));
        },
      ),
    );
  }
}