import 'package:flutter/material.dart';

class AddCommentScreen extends StatefulWidget {

  @override
  _AddCommentScreenState createState() => _AddCommentScreenState();
}

class _AddCommentScreenState extends State<AddCommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add your comment',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                  child: Text('Enter your name'),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  margin: EdgeInsets.only(left: 5, right: 5),
                  child: Container(
                      width: 350,
                      height: 50,
                      child: TextField()),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                  child: Text('Enter your e-mail'),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  margin: EdgeInsets.only(left: 5, right: 5),
                  child: Container(
                      width: 350,
                      height: 50,
                      child: TextField()),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                  child: Text('Add your comment'),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  margin: EdgeInsets.only(left: 5, right: 5),
                  child: Container(
                      margin: EdgeInsets.only(bottom: 8),
                      width: 350,
                      height: 50,
                      child: TextField()),
                ),
                RaisedButton(

                  color: Colors.blue,
                  splashColor: Colors.white,
                  onPressed: () {
                    //Navigator.push(
                    //context,
                    //MaterialPageRoute(builder: (context) => FlutterBottomSheet()),
                    //);
                  },
                  child: Container(

                    width: 100,
                    alignment: Alignment.center,
                    child: Text('Publish',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
