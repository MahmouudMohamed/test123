import 'package:flutter/material.dart';

import '../../model/category.dart';

class CategoryItem extends StatelessWidget {
  Categorys category;
  int index;

  CategoryItem({required this.category, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(
            category.imagePath,
          ),
          Text(
            category.title,
            style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),
          )
        ],
      ),
    );
  }
}
