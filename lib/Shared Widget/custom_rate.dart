import 'package:flutter/material.dart';

class CustomRate extends StatelessWidget {
  String vote;
   CustomRate({required this.vote,super.key});

  @override
  Widget build(BuildContext context) {
    return  Wrap(
      children: [
        const Icon(
          Icons.star,
          color: Colors.yellow,
          size: 23,
        ),
        Text(
          vote,
          style: const TextStyle(color: Colors.white,fontSize: 18),
        ),
      ],
    );
  }
}
