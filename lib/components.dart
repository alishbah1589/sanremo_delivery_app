import 'package:flutter/material.dart';

Widget roundedInputField({
  required String label,
  required TextEditingController controller,
  bool obscureText = false,
  String? Function(String?)? validator,
}) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    validator: validator,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(fontWeight: FontWeight.w500),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      filled: true,
      fillColor: Colors.white.withOpacity(0.6),
    ),
  );
}

Widget roundedButton({
  required String text,
  required VoidCallback onPressed,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 249, 216, 245),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      minimumSize: const Size.fromHeight(45),
    ),
    child: Text(
      text,
      style: const TextStyle(
          color: Color.fromARGB(255, 231, 34, 169),
          fontWeight: FontWeight.bold),
    ),
  );
}
 //This screen contains the Buttons colors, so if you have addedd anny buttons in your screen, so to pursue
 //the theme, make buttons by importing this file



