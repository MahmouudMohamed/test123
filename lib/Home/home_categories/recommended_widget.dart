import 'package:flutter/material.dart';

import '../view/reccommended_view_movie.dart';
import '../view/row_category.dart';

class RecommendedWidget extends StatelessWidget {
  const RecommendedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.03),
      padding: EdgeInsets.all(20),
      color: Color(0xff282A28),
      child: Column(
        children: [
          RowCategory(left: "Recommended"),
          SizedBox(height: 15,),
          RecommendedViewMovie(),
        ],
      ),
    );
  }
}
