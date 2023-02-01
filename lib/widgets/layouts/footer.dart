import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 22,
      width: MediaQuery.of(context).size.width,
      child: const Center(
        child: Text(
          'Version 3.9.3',
          style: TextStyle(
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}
