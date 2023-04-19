import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../_articles_news/presentation/news_controller/bloc/articles_bloc.dart';
import '../../../../_articles_news/presentation/news_controller/bloc/articles_event.dart';
import '../../../../_authenticator/presentation/auth_screens/profile_screen.dart';
import '../../../../_articles_news/presentation/news_screens/news_article_screen.dart';
import '../../../../_weather_news/presentation/weather_screens/weather_screen.dart';
import '../../../../core/services/services_locator.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  int turnHomeScreen = 0;

  bool isTurn = true;

  PageController controllerHomeScreen = PageController();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controllerHomeScreen,
        children: [
          BlocProvider(
              create: (context) =>
                  sl<ArticlesBloc>()..add(FetchArticleDataEvent()),
              child: const NewsArticleScreen()),
          const WeatherScreen(),
          const ProfileScreen()
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
