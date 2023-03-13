// ignore_for_file: unrelated_type_equality_checks, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_app_clean_architecture/_intro_screens/screens/controller/intro_state.dart';
import 'package:news_app_clean_architecture/core/core_components/custom_do_animtion/custom_fade_animation.dart';
import 'package:news_app_clean_architecture/core/core_components/custom_text/text.dart';
import 'package:news_app_clean_architecture/home_screen_categories.dart';
import 'package:news_app_clean_architecture/text3.dart';

import 'test2.dart';
import '_intro_screens/screens/controller/intro_bloc.dart';

class PageViewScreen extends StatelessWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return BlocBuilder<IntroScreensBloc, IntroScreensState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<IntroScreensBloc>(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: false,
            title:
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomText(
                  DateFormat.MMMMEEEEd().format(DateTime.now()).toString(),
                  isBold: false),
              CustomText("Welcome Mohamed ,"),
            ]),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/images/image_profile.jpg"),
                  ))
            ],
          ),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (value) {
              state.turnHomeScreen = value;
            },
            controller: state.controllerHomeScreen,
            children: const [
              HomeScreenCategories(),
              Test2(),
              Test3(),
            ],
          ),
          bottomNavigationBar: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: media.width * .14, vertical: media.height * .04),
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
                        margin:
                            EdgeInsets.symmetric(horizontal: media.width * .05),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            bottomNavigation[index].index == true
                                ? fadeElasticIn(
                                    child: Container(
                                      width: media.width * .05,
                                      height: media.height * .007,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: media.width * .03),
                                      decoration: BoxDecoration(
                                          color: Colors.yellow.shade500,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                  )
                                : Container(),
                            Expanded(
                              flex: 3,
                              child: IconButton(
                                  onPressed: () {
                                    bloc.add(ActiveIconEvent(index: index));
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
          )),
        );
      },
    );
  }
}
