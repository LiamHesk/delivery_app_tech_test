import 'package:delivery_app_tech_test/repository/account/sign_in_response.dart';
import 'package:delivery_app_tech_test/utilities/login/sign_in.dart';
import 'package:delivery_app_tech_test/widgets/buttons/custom_textbutton.dart';
import 'package:delivery_app_tech_test/widgets/input/custom_textfield.dart';
import 'package:delivery_app_tech_test/widgets/layouts/footer.dart';
import 'package:delivery_app_tech_test/widgets/layouts/header.dart';
import 'package:delivery_app_tech_test/widgets/layouts/page_title.dart';
import 'package:delivery_app_tech_test/widgets/notifications/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool alreadySignedIn = false;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();

    instantiatePrefs();
  }

  void instantiatePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: Header(
        height: MediaQuery.of(context).size.height / 18,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const PageTitle(text: 'Login'),
            Padding(
              padding: const EdgeInsets.all(
                30.0,
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 20,
                width: MediaQuery.of(context).size.width / 1.2,
                child: CustomTextfield(
                  controller: _email,
                  label: 'Email Address',
                  obscure: false,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: CustomTextfield(
                      controller: _password,
                      label: 'Password',
                      obscure: true,
                    ),
                  ),
                  CustomTextButton(
                    text: 'Forgot password?',
                    size: 14.0,
                    underline: false,
                    function: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 20,
                width: MediaQuery.of(context).size.width / 1.2,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueGrey[900]!),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: () async {
                    SignInResponse response =
                        await signIn(_email.text, _password.text);

                    if (context.mounted) {
                      if (response.success) {
                        prefs.setString('token', response.token!);

                        if (ModalRoute.of(context)!.settings.name != '/Order') {
                          Navigator.pushNamed(
                            context,
                            '/Order',
                          );
                        }
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        customSnackBar(context, response.message),
                      );
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'New here?',
                    style: TextStyle(
                      color: Colors.blueGrey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  CustomTextButton(
                    text: 'Create an account',
                    size: 16.0,
                    underline: true,
                    function: () {},
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      style: TextStyle(
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.w800,
                        fontSize: 26.0,
                      ),
                      text: '\u{2190} ',
                    ),
                    TextSpan(
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w800,
                        fontSize: 14.0,
                      ),
                      text: 'Back to user type screen',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
