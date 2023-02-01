import 'package:flutter/material.dart';
import 'package:delivery_app_tech_test/screens/login.dart';
import 'package:delivery_app_tech_test/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
      routes: routes,
    );
  }
}
