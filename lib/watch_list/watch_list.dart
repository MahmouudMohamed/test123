import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test123/watch_list/view_model/watch_list_cubit.dart';

class WatchList extends StatelessWidget {
  static const String routeName = "w";

  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WatchListCubit()..getWatchList(),
      child: BlocBuilder<WatchListCubit, WatchListState>(
        builder: (context, state) {
          var watchList = WatchListCubit.get(context);
          if(state is GetMoviesWatchListLoadingState){
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.yellow,
              ),
            );
          }
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: ListView.separated(itemBuilder: (context, index) =>
                      Text(
                        watchList.watchListModel?.results?[index].title ?? "",
                        style: TextStyle(color: Colors.white, fontSize: 30,),
                      ),
                    separatorBuilder: (context, index) => SizedBox(height: 15,),
                    itemCount: watchList.watchListModel?.results?.length ?? 0,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
