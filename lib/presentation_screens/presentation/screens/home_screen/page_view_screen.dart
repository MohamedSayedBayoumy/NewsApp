// ignore_for_file: unrelated_type_equality_checks, must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/presentation_screens/presentation/screens/home_screen/home_screen_categories.dart';

import '../../../../_authenticator/presentation/auth_screens/profile_screen.dart';
import '../../../domain/entitie/entite_model.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  int turnHomeScreen = 0;

  bool isTurn = true;

  Color x = Colors.yellowAccent;

  PageController controllerHomeScreen = PageController();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controllerHomeScreen,
        children: const [
          HomeScreenCategories(),
          ProfileScreen(),
          ProfileScreen()
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: media.width * .05),
        child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            iconSize: media.width * .07,
            currentIndex: turnHomeScreen,
            selectedItemColor: Colors.yellowAccent,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              setState(() {
                controllerHomeScreen.jumpToPage(
                  index,
                );
                turnHomeScreen = index;
              });
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                label: "",
                icon: ImageIcon(
                  AssetImage("assets/icons/homepage.png"),
                ),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: ImageIcon(
                  AssetImage(
                    "assets/icons/cloud.png",
                  ),
                ),
              ),
              BottomNavigationBarItem(
                label: "",
                icon: ImageIcon(
                  AssetImage("assets/icons/user.png"),
                ),
              ),
            ]),
      ),
    );
  }
}
