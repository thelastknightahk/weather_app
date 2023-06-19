

import 'package:flutter/material.dart';

Widget textFormFieldWidget(BuildContext context, String title){
  return TextFormField(
    decoration: InputDecoration(
      labelText: '$title',
      labelStyle: TextStyle(
        color: Colors.grey[600],
      ),
      filled: true,
      fillColor: Colors.grey[100],
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Colors.black26,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      errorStyle: TextStyle(color: Colors.red),
      contentPadding: EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 20.0,
      ),
    ),
    style: TextStyle(
      fontSize: 16.0,
      color: Colors.black,
    ),

  );
}