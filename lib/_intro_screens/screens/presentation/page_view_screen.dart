// ignore_for_file: unrelated_type_equality_checks, must_be_immutable

import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/_intro_screens/screens/presentation/home_screen_categories.dart';

import '../../domain/entitie/entite_model.dart';
import '../../../test2.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  dynamic turnHomeScreen;

  PageController controllerHomeScreen = PageController();

  List<BottomNavigationModel> bottomNavigation = [
    BottomNavigationModel(image: "assets/icons/homepage.png", index: true),
    BottomNavigationModel(image: "assets/icons/cloud.png", index: false),
    BottomNavigationModel(image: "assets/icons/user.png", index: false),
  ];

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) {
          setState(() {
            turnHomeScreen = value;
          });
        },
        controller: controllerHomeScreen,
        children: const [
          HomeScreenCategories(),
          Test2(),
          // Test3(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: media.width * .14, vertical: media.height * .01),
        child: Container(
          width: media.width,
          height: media.height * .08,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(.5),
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: bottomNavigation.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: media.width * .12,
                    margin: EdgeInsets.symmetric(horizontal: media.width * .05),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: IconButton(
                              onPressed: () {
                                for (int buttonIndex = 0;
                                    buttonIndex < bottomNavigation.length;
                                    buttonIndex++) {
                                  if (buttonIndex == index) {
                                    // if (controllerHomeScreen.hasClients) {
                                    setState(() {
                                      bottomNavigation[buttonIndex].index =
                                          true;
                                      controllerHomeScreen.jumpToPage(index);
                                    });
                                    // }
                                  } else {
                                    // if (controllerHomeScreen.hasClients) {
                                    setState(() {
                                      bottomNavigation[buttonIndex].index =
                                          false;

                                      controllerHomeScreen.jumpToPage(index);
                                    });

                                    // }
                                  }
                                }
                              },
                              icon: Image.asset(
                                bottomNavigation[index].image.toString(),
                                color: bottomNavigation[index].index == true
                                    ? Colors.yellow.shade500
                                    : Colors.grey,
                              )),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
