import 'package:flutter/material.dart';

class Constants {
  Constants._();

  static TextStyle getPokeNameTextStyle() {
    return const TextStyle(
        color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold);
  }

  static TextStyle getTitleTextStyle() {
    return const TextStyle(
        color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold);
  }
}
