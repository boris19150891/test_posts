import 'package:flutter/material.dart';
import 'package:test_task_app/models/users_model.dart';
import 'package:test_task_app/screens/user_page_screen.dart';

class UserListScreen extends StatefulWidget {

  UsersModel users;
  UserListScreen({Key key, this.users}) : super(key: key);

  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('     User list',
          style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
      body: Card(
        child: Column(
          children: <Widget>[
            _buildSuggestions(),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestions() {
    return Expanded(
      child: ListView.builder(
          itemCount: widget.users.content.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserPageScreen(user: widget.users.content[index])),
                      );
                    },
                    child: ListTile(
                      leading: Icon(Icons.account_circle, color: Colors.blue, size: 40,),
                      title: Text(widget.users.content[index].username,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                      subtitle: Text(widget.users.content[index].name),
                    ),
                  ),
                ),
              ],
            );
          }
      ),
    );
  }
}

