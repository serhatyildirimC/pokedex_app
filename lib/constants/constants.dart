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

  static TextStyle getPokeInfoTextStyle() {
    return const TextStyle(
      fontSize: 16,
    );
  }

  static TextStyle getPokeInfoLabelTextStyle() {
    return const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  }
}
