import 'package:flutter/material.dart';

Size displaySize(BuildContext context) {
  return MediaQuery.sizeOf(context);
}

double displayHeight(BuildContext context) {
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  return displaySize(context).width;
}
