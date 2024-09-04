import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'Home/view_model/home_cuibt.dart';
import 'Home/view_model/home_state.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  static const String routeName = "home";


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return SafeArea(
            child: Scaffold(
                bottomNavigationBar: BottomNavigationBar(
                    iconSize: 30,
                    currentIndex: cubit.index,
                    onTap: (value) {
                      cubit.changeHomeScreen(value);
                    },
                    items: [
                      BottomNavigationBarItem(
                        icon: Column(
                          children: [
                            ImageIcon(
                              AssetImage(
                                "assets/images/home.png",
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            )
                          ],
                        ),
                        label: "HOME",
                      ),
                      BottomNavigationBarItem(
                        icon: Column(
                          children: [
                            ImageIcon(
                              AssetImage("assets/images/search.png"),
                            ),
                            SizedBox(
                              height: 5,
                            )
                          ],
                        ),
                        label: "SEARCH",
                      ),
                      BottomNavigationBarItem(
                        icon: Column(
                          children: [
                            ImageIcon(
                              AssetImage("assets/images/browse.png"),
                            ),
                            SizedBox(
                              height: 5,
                            )
                          ],
                        ),
                        label: "BROWSE",
                      ),
                      BottomNavigationBarItem(
                        icon: Column(
                          children: [
                            ImageIcon(
                              AssetImage("assets/images/watchlist.png"),
                            ),
                            SizedBox(
                              height: 5,
                            )
                          ],
                        ),
                        label: "WATCHLIST",
                      ),
                    ]),
                body: cubit.page[cubit.index]),
          );
        },
      ),
    );
  }

}
// bottomNavigationBar: BottomNavyBar(
//   selectedIndex: index,
//   showElevation: true,
//   // use this to remove appBar's elevation
//   onItemSelected: (v) {
//     index = v;
//     setState(() {
//
//     });
//     pageController.animateToPage(index,
//         duration: Duration(milliseconds: 300), curve: Curves.ease);
//     setState(() {
//
//     });
//   },
//   items: [
//     BottomNavyBarItem(
//       icon: Icon(Icons.apps),
//       title: Text('Home'),
//       activeColor: Colors.red,
//     ),
//     BottomNavyBarItem(
//         icon: Icon(Icons.people),
//         title: Text('Users'),
//         activeColor: Colors.purpleAccent
//     ),
//     BottomNavyBarItem(
//         icon: Icon(Icons.message),
//         title: Text('Messages'),
//         activeColor: Colors.pink
//     ),
//     BottomNavyBarItem(
//         icon: Icon(Icons.settings),
//         title: Text('Settings'),
//         activeColor: Colors.blue
//     ),
//   ],
// )
