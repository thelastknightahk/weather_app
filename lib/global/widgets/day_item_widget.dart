import 'package:flutter/material.dart';

Widget dayItemWidget(BuildContext context, String date, bool clicked) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Text(
          '$date',
          style: TextStyle(
              fontSize: 20, color: clicked ? Colors.black87 : Colors.black38),
        ),
      ),
      Container(
        width: 15,
        height: 2,
        color: clicked ? Colors.black45 : Colors.black12,
      )
    ],
  );
}
