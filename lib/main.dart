// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: FirstPage(),
    routes: {
      '/first': (context) => FirstPage(),
      '/second': (context) => SecondPage(),
    },
  ));
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("First Page"),
          centerTitle: true,
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              User user = User(name: 'Alex', age: 35);
              Navigator.pushNamed(context, '/second', arguments: user);
            },
            child: const Text('Second Page'),
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final User user;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('${user.name} - ${user.age}'),
          centerTitle: true,
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go Back'),
          ),
        ),
      ),
    );
  }
}

class User {
  final String name;
  final int age;

  User({required this.name, required this.age});
}
