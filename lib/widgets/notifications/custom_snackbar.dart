import 'package:flutter/material.dart';

SnackBar customSnackBar(BuildContext context, String text) {
  return SnackBar(
    content: Center(
      child: Text(text),
    ),
    width: MediaQuery.of(context).size.width / 1.5,
    backgroundColor: Colors.blueGrey[900],
    shape: const StadiumBorder(),
    behavior: SnackBarBehavior.floating,
  );
}
