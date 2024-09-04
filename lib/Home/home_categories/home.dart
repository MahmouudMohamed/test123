import 'package:flutter/material.dart';
import 'package:test123/Home/home_categories/popular_widget.dart';
import 'package:test123/Home/home_categories/recommended_widget.dart';
import 'new_releases_widget.dart';


class Home extends StatelessWidget {
  static const String routeName = "home1";

   Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PopularWidget(),
          NewReleasesWidget(),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: RecommendedWidget(),
          ),

        ],
      ),
    );
  }
}

// FutureBuilder<PopularMoviesModel?>(
//   future: ApiManger.getPopular(),
//   builder: (context, snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return Center(
//           child: CircularProgressIndicator(
//         color: Colors.green,
//       ));
//     }
//     if (snapshot.hasError) {
//       return Center(
//         child: Column(
//           children: [
//             Text(
//               "something went wrong",
//               style: TextStyle(color: Colors.white),
//             ),
//           ],
//         ),
//       );
//     }
//     var movie = snapshot.data!.results ?? [];
//     return CarouselSlider(
//         items: movie.map((i) =>
//             CustomMovie(results: i,)).toList(),
//         options: CarouselOptions(
//           autoPlay: true
//           ,
//           viewportFraction: 1,
//           height: MediaQuery.of(context).size.height * 0.38,
//         ));
//   },
// ),

//     Container(
//       margin:
//       EdgeInsets.only(top: MediaQuery
//           .sizeOf(context)
//           .height * 0.03),
//       padding: EdgeInsets.all(20),
//       color: Color(0xff282A28),
//       child: Column(
//         children: [
//           RowCategory(left: "New Releases"),
//           SizedBox(
//             height: 15,
//           ),
//           ViewMovie(),
//         ],
//       ),
//     ),
//     Container(
//       margin:
//       EdgeInsets.only(top: MediaQuery
//           .sizeOf(context)
//           .height * 0.03),
//       padding: EdgeInsets.all(20),
//       color: Color(0xff282A28),
//       child: Column(
//         children: [
//           RowCategory(left: "New Releases"),
//           SizedBox(
//             height: 15,
//           ),
//           ViewMovie(),
//         ],
//       ),
//     ),
//   ],
// ),

// return SingleChildScrollView(
//   child: Column(
//     children: [
//       MovieP(),
//       Container(
//         margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.03),
//         padding: EdgeInsets.all(20),
//         color: Color(0xff282A28),
//         child: Column(
//           children: [
//             RowCategory(left: "New Releases"),
//             SizedBox(height: 15,),
//             ViewMovie(),
//           ],
//         ),
//       ),
//       Container(
//         margin: EdgeInsets.only(top: MediaQuery.sizeOf(context).height*0.03),
//         padding: EdgeInsets.all(20),
//         color: Color(0xff282A28),
//         child: Column(
//           children: [
//             RowCategory(left: "New Releases"),
//             SizedBox(height: 15,),
//             ViewMovie(),
//           ],
//         ),
//       ),
//     ],
//   ),
// );

//FutureBuilder<RePopular?>(
//     future: ApiManger.getPopular(),
//     builder: (context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return Center(
//             child: CircularProgressIndicator(
//               color: Colors.green,
//             ));
//       }
//       if (snapshot.hasError) {
//         print("object");
//         return Center(
//           child: Column(
//             children: [
//               Text("something went wrong"),
//             ],
//           ),
//         );
//       }
//       var movie = snapshot.data!.results ?? [];
//       return ListView.builder(itemBuilder: (context, index) {
//         return MovieP(results: movie[index]);
//       },
//       itemCount:movie.length,);
//     },
//         );
