import 'package:flutter/material.dart';

class BookMark extends StatefulWidget {
  const BookMark({super.key});

  @override
  State<BookMark> createState() => BookMarkState();
}
bool _checkMark = false;

class BookMarkState extends State<BookMark> {
  @override
  Widget build(BuildContext context) {
    return  InkWell(
        onTap: () {
          setState(() {
            _checkMark=!_checkMark;
          });
        },
        child: _checkMark
            ? Image.asset("assets/images/bookmark.png")
            : Image.asset("assets/images/unbookmark.png"));
  }
}
