import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:news_app_clean_architecture/_weather_news/domain/weather_base_use_case/weather_base_usecase.dart';
import 'package:news_app_clean_architecture/_weather_news/domain/weather_entites/weather_model.dart';
import 'package:news_app_clean_architecture/core/widgets/custom_text/text.dart';
import 'package:news_app_clean_architecture/core/global/globals.dart';

import '../../../../_articles_news/presentation/news_screens/news_article_screen.dart';
import '../../../../_weather_news/data/weather_remote_data_source/weather_remote_data_source.dart';
import '../../../../_weather_news/data/weather_repository_data/weather_repository_data.dart';
import '../../../../_weather_news/domain/weather_base_repository/base_repository_weather.dart';
import '../../../../_weather_news/presentation/weather_screens/google_map.dart';

class HomeScreenCategories extends StatefulWidget {
  const HomeScreenCategories({Key? key}) : super(key: key);

  @override
  State<HomeScreenCategories> createState() => _HomeScreenCategoriesState();
}

class _HomeScreenCategoriesState extends State<HomeScreenCategories>
    with TickerProviderStateMixin {
  late TabController _tabController = TabController(length: 3, vsync: this);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.animateTo(0, curve: Curves.bounceOut);
  }

  static const List<Widget> _views = [
    NewsArticleScreen(),
    NewsArticleScreen(),
    NewsArticleScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    print(sharedPreferences.getString("image").toString());
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(text: "EG"),
            ],
          ),
          IconButton(
              onPressed: () async {
                WeatherBaseRemoteDataSource weatherBaseRemoteDataSource = WeatherRemoteDataSource();
                WeatherBaseRepository weatherBaseRepository =
                WeatherRepository(weatherBaseRemoteDataSource);
                BaseWeatherUseCase baseWeatherUseCase =BaseWeatherUseCase(weatherBaseRepository);
                 final x = await baseWeatherUseCase.fetchWeatherByLanAndLat() ;
                          print("lol : ${x.codeCountry}") ;
                              },
              icon: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/image_profile.jpg"),
              )),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(media.width * .03),
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              const GoogleMapScreen(),
              SliverAppBar(
                pinned: true,
                backgroundColor: Colors.black87,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          CustomText(text: "News"),
                          const Spacer(),
                          TextButton(
                              onPressed: () {
                                /// TODO : --------
                              },
                              child: CustomText(
                                text: "View All",
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                expandedHeight: 0,
              ),
              SliverAppBar(
                pinned: true,
                backgroundColor: Colors.black87,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: DefaultTabController(
                      length: 3,
                      child: Container(
                        color: Colors.transparent,
                        height: media.height * .06,
                        width: media.width,
                        child: TabBar(
                          controller: _tabController,
                          physics: const BouncingScrollPhysics(),
                          isScrollable: true,
                          splashBorderRadius: BorderRadius.circular(30),
                          indicatorPadding: const EdgeInsets.all(0),
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey.shade600,
                          ),
                          tabs: [
                            Tab(
                              child: CustomText(text: "All News"),
                            ),
                            Tab(
                              child: CustomText(text: "Sports"),
                            ),
                            Tab(
                              child: CustomText(text: "Weather"),
                            ),
                          ],
                        ),
                      )),
                ),
                expandedHeight: 0,
              ),
            ];
          },
          body: Container(
            color: Colors.black,
            height: media.height,
            width: media.width,
            child: TabBarView(
              physics: const BouncingScrollPhysics(),
              controller: _tabController,
              children: _views,
            ),
          ),
        ),
      ),
    );
  }
}
