import 'package:delivery_app_tech_test/resources/providers/account_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:delivery_app_tech_test/screens/login/login.dart';
import 'package:delivery_app_tech_test/routes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AccountProvider(),
      child: const MyApp(),
    ),
  );
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
