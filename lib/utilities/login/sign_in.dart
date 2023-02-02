import 'dart:convert';

import 'package:delivery_app_tech_test/repository/account/sign_in_response.dart';
import 'package:http/http.dart' as http;

Future<SignInResponse> signIn(String username, String password) async {
  var url = Uri.https('dev2.deliveryapp.com', 'api/user/authenticate');
  final response =
      await http.post(url, body: {'email': username, 'password': password});

  if (response.statusCode == 200) {
    return SignInResponse(success: true, message: 'Successfully logged in.');
  } else if (response.statusCode == 422) {
    return SignInResponse(
        success: true, message: 'The provided credentials are incorrect.');
  } else {
    dynamic result = jsonDecode(response.body);
    return SignInResponse(success: false, message: result['message']);
  }
}
