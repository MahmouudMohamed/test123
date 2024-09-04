import 'dart:ui';

import 'package:flutter/material.dart';

class Categorys {
  // String id;
  String title;
  String imagePath;

  Categorys({
    required this.title,
    required this.imagePath,
  });

  static List<Categorys> getCategory() {
    return [
      Categorys(
        title: "Action",
        imagePath: "assets/images/action.png",
      ),
      Categorys(
        title: "Action",
        imagePath: "assets/images/action.png",
      ),
      Categorys(
        title: "Action",
        imagePath: "assets/images/action.png",
      ),
      Categorys(
        title: "Action",
        imagePath: "assets/images/action.png",
      ),
      Categorys(
        title: "Action",
        imagePath: "assets/images/action.png",
      ),
      Categorys(
        title: "Action",
        imagePath: "assets/images/action.png",
      ),
      Categorys(
        title: "Action",
        imagePath: "assets/images/action.png",
      ),      Categorys(
        title: "Action",
        imagePath: "assets/images/action.png",
      ), Categorys(
        title: "Action",
        imagePath: "assets/images/action.png",
      ), Categorys(
        title: "Action",
        imagePath: "assets/images/action.png",
      ), Categorys(
        title: "Action",
        imagePath: "assets/images/action.png",
      ),Categorys(
        title: "Action",
        imagePath: "assets/images/action.png",
      ),Categorys(
        title: "Action",
        imagePath: "assets/images/action.png",
      ),Categorys(
        title: "Action",
        imagePath: "assets/images/action.png",
      ),
    ];
  }
}
