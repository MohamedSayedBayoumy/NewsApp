import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import '../../../../_articles_news/presentation/news_screens/news_article_screen.dart';
import '../../../../_weather_news/data/weather_remote_data_source/weather_remote_data_source.dart';
import '../../../../_weather_news/data/weather_repository_data/weather_repository_data.dart';
import '../../../../_weather_news/domain/weather_base_repository/base_repository_weather.dart';
import '../../../../_weather_news/domain/weather_base_use_case/weather_base_usecase.dart';
import '../../../../core/global/globals.dart';
import '../../../../core/widgets/custom_text/text.dart';

// ignore: must_be_immutable
class MyStatelessWidget extends StatefulWidget {
  MyStatelessWidget({super.key});

  static List<Widget> views = const [
    NewsArticleScreen(),
    NewsArticleScreen(),
    NewsArticleScreen(),
  ];

  @override
  State<MyStatelessWidget> createState() => _MyStatelessWidgetState();
}

class _MyStatelessWidgetState extends State<MyStatelessWidget> {
  List<String> tabs = ["News", "Weather", "Sport"];

  String themeMap = "";

  @override
  void initState() {
    DefaultAssetBundle.of(context).loadString("assets/map.json").then((value) {
      themeMap = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: media.height * .08,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomText(
            text: DateFormat.MMMMEEEEd().format(DateTime.now()).toString(),
          ),
          CustomText(
              text:
                  "Welcome ${sharedPreferences.getString("name")!.split(" ").first} ,"),
        ]),
        actions: [
          IconButton(
              onPressed: () async {
                WeatherBaseRemoteDataSource weatherBaseRemoteDataSource =
                    WeatherRemoteDataSource();
                WeatherBaseRepository weatherBaseRepository =
                    WeatherRepository(weatherBaseRemoteDataSource);
                BaseWeatherUseCase baseWeatherUseCase =
                    BaseWeatherUseCase(weatherBaseRepository);
                final x = await baseWeatherUseCase.fetchWeatherByLanAndLat();
                final i = x.weather!.map((e) {
                  print("hi : ${e.statusWeather}");
                });
                print(i);
              },
              icon: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/image_profile.jpg"),
              )),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: media.height * .01),
        child: DefaultTabController(
          length: tabs.length,
          child: TabBarView(
            physics: const BouncingScrollPhysics(),
            children: MyStatelessWidget.views,
          ),
        ),
      ),
    );
  }
}
