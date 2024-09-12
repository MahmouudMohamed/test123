import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.36,
       child:  ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 15),
        scrollDirection: Axis.horizontal,
        itemCount: 15, // The number of shimmer items
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[600]!,
            highlightColor: Colors.grey[200]!,
            child: Card(
              color: Colors.grey,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * 0.26,
                    width: MediaQuery.sizeOf(context).height * 0.19,
                    color: Colors.grey[300],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.38,
                    child: Container(
                      color: Colors.grey[300],
                      height: 20,
                    ),
                  ),
                  Center(
                    child: Container(
                      color: Colors.grey[500],
                      height: 20,
                      width: MediaQuery.of(context).size.width * 0.38,
                    ),
                  ),
                  Container(
                    color: Colors.grey[400],
                    height: 20,
                    width: MediaQuery.of(context).size.width * 0.38,
                  ),
                ],
              ),
            ),
          );
        },
      )

    );
  }
}
///
///SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.40,
//                   child: Center(
//                 child: CircularProgressIndicator(color: Colors.yellow).redacted(
//                   context: context,
//                   redact: true,
//                   configuration: RedactedConfiguration(
//                     animationDuration:
//                     const Duration(milliseconds: 800), //default
//                   ),
//                 ),
//               ),
//               );

