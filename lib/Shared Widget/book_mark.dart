
import 'package:flutter/material.dart';

class BookMark extends StatefulWidget {
  bool checkMark = false;
   BookMark({  super.key});

  @override
  State<BookMark> createState() => BookMarkState();
}


class BookMarkState extends State<BookMark> {
  @override
  Widget build(BuildContext context) {
    return  InkWell(
        onTap: () {
          setState(() {
            widget.checkMark=!widget.checkMark;
          });
        },
        child: widget.checkMark
            ? Image.asset("assets/images/bookmark.png")
            : Image.asset("assets/images/unbookmark.png"));
  }
}
