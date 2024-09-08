import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test123/Home/home_categories/film_details.dart';
import 'package:test123/browse/view/custom_browser_details.dart';
import 'package:test123/browse/view_model/category_cubit.dart';

import '../../Shared Widget/book_mark.dart';
import '../../Shared Widget/custom_rate.dart';

class BrowseDetails extends StatelessWidget {
  const BrowseDetails({super.key});

  static const routeName = "browse_details";

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as dynamic;
    return BlocProvider(
      create: (context) =>
          CategoryCubit()..getBrowseShow(arguments.id.toString()),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is BrowseShowLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.yellow,
              ),
            );
          }
          if (state is BrowseShowErrorState) {
            return const Center(
              child: Text(
                "Some Error Occurred",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          if (state is BrowseShowSuccessState) {
            return CustomBrowserDetails(arguments: arguments);
          }

          return Container();
        },
      ),
    );
  }
}
