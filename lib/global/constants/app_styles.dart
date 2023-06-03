import 'package:flutter/material.dart';

InputDecoration getInputDecoration(
    {required String hint, required bool darkMode}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    fillColor: darkMode ? Colors.black54 : Colors.white,
    hintText: hint,
    prefixIcon: const Icon(
      Icons.location_city,
      color: Colors.black54,
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(color: Colors.black54, width: 2.0)),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black45, width: 2),
      borderRadius: BorderRadius.circular(4.0),
    ),
  );
}
