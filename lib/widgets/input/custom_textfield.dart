import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({
    Key? key,
    required this.controller,
    required this.label,
    required this.obscure,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final bool obscure;

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  late bool hideText;

  @override
  void initState() {
    if (widget.obscure) {
      hideText = true;
    } else {
      hideText = false;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: hideText,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusColor: Colors.grey,
        labelText: widget.label,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        suffixIcon: widget.obscure
            ? IconButton(
                icon: Icon(
                  hideText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    hideText = !hideText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
