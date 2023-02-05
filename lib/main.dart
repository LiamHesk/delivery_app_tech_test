import 'package:delivery_app_tech_test/resources/providers/account_provider.dart';
import 'package:delivery_app_tech_test/screens/order/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:delivery_app_tech_test/screens/login/login.dart';
import 'package:delivery_app_tech_test/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  bool alreadySignedIn = false;
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getString('token') != null &&
      prefs.getString('token')!.isNotEmpty) {
    alreadySignedIn = true;
  }

  runApp(
    ChangeNotifierProvider(
      create: (context) => AccountProvider(),
      child: MyApp(
        signedIn: alreadySignedIn,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.signedIn,
  }) : super(key: key);

  final bool signedIn;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: signedIn ? const Order() : const Login(),
      routes: routes,
    );
  }
}
