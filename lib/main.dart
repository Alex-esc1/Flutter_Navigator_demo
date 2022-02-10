// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

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

// ignore: must_be_immutable
class SecondPage extends StatelessWidget {
  late User user;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    RouteSettings settings = ModalRoute.of(context).settings;
    user = settings.arguments;
    return Scaffold(
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
    );
  }
}

class User {
  final String name;
  final int age;

  User({required this.name, required this.age});
}
