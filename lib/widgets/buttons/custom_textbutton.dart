import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.text,
    required this.size,
    required this.underline,
    required this.function,
  }) : super(key: key);

  final String text;
  final double size;
  final bool underline;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function(),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.blueGrey[900],
          fontWeight: FontWeight.w800,
          fontSize: size,
          decoration:
              underline ? TextDecoration.underline : TextDecoration.none,
        ),
      ),
    );
  }
}
