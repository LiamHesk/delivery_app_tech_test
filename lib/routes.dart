import 'package:flutter/material.dart';
import 'package:delivery_app_tech_test/screens/order/order.dart';
import 'package:delivery_app_tech_test/screens/login/login.dart';

var routes = <String, WidgetBuilder>{
  '/Login': (BuildContext context) => const Login(),
  '/Order': (BuildContext context) => const Order(),
};
