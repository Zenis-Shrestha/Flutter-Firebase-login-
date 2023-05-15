import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller ;
  final String hintText;
  final bool obscureText;
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return //username
        Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          fillColor: Color.fromARGB(255, 228, 210, 210),
          filled: true,
          hintText:hintText,
          hintStyle: TextStyle(color: Color.fromARGB(255, 164, 164, 184)),
        ),
      ),
    );
  }
}
