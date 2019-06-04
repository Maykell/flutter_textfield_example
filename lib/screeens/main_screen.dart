import 'package:flutter/material.dart';
import 'package:flutter_textfield_validation/domain/User.dart';
import 'package:meta/meta.dart';

class MainScreen extends StatelessWidget {

  final User user;

  MainScreen({Key key, @required this.user});

  @override
  Widget build(BuildContext context) {

    final space = SizedBox(
      height: 10.0,
    );

    final appBar = AppBar(
      title: Text("MainScreen"),
    );

    final scaffold = Scaffold(
      appBar: appBar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              user.name,
              style: TextStyle(
                fontSize: 35.0,
              ),
            ),
            space,
            Text(
              user.email,
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
            space,
            Text(
              user.password,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            space,
            RaisedButton(
              child: Text("Back"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );

    return scaffold;
  }
}
