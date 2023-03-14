import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:news_app_clean_architecture/core/core_components/custom_text/text.dart';
import 'package:news_app_clean_architecture/core/global/globals.dart';

import '_articles_news/presentation/news_screens/news_article_screen.dart';

class HomeScreenCategories extends StatefulWidget {
  const HomeScreenCategories({Key? key}) : super(key: key);

  @override
  State<HomeScreenCategories> createState() => _HomeScreenCategoriesState();
}

class _HomeScreenCategoriesState extends State<HomeScreenCategories>
    with TickerProviderStateMixin {
  late TabController _tabController = TabController(length: 3, vsync: this);

  String themeMap = "";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.animateTo(0, curve: Curves.bounceOut);
    DefaultAssetBundle.of(context).loadString("assets/map.json").then((value) {
      themeMap = value;
    });
  }

  static const List<Widget> _views = [
    NewsArticleScreen() ,
    NewsArticleScreen() ,
    NewsArticleScreen() ,
  ];

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: media.height * .08,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomText(DateFormat.MMMMEEEEd().format(DateTime.now()).toString(),
              isBold: false),
          CustomText("Welcome Mohamed ,"),
        ]),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText("EG"),
            ],
          ),
          IconButton(
              onPressed: () {},
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
              SliverAppBar(
                pinned: false,
                backgroundColor: Colors.black87,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Container(
                    width: media.width,
                    height: media.height * .3,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.1),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: media.width * .02,
                                      vertical: media.height * .005),
                                  child: GoogleMap(
                                    compassEnabled: false,
                                    zoomControlsEnabled: false,
                                    onMapCreated:
                                        (GoogleMapController controller) async {
                                      await controller.animateCamera(
                                          CameraUpdate.newCameraPosition(
                                              CameraPosition(
                                                  target: LatLng(
                                                      sharedPreferences
                                                          .getDouble(
                                                          "latitude")!
                                                          .toDouble(),
                                                      sharedPreferences
                                                          .getDouble(
                                                          "longitude")!
                                                          .toDouble()),
                                                  bearing: 45,
                                                  tilt: 45,
                                                  zoom: 16)));
                                      controller.setMapStyle(themeMap);
                                    },
                                    initialCameraPosition: const CameraPosition(
                                      target: LatLng(0.0, 0.0),
                                      zoom: 8.0,
                                    ),
                                    markers: {
                                      Marker(
                                        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
                                        markerId: const MarkerId(("")),
                                        position: LatLng(
                                            sharedPreferences
                                                .getDouble("latitude")!
                                                .toDouble(),
                                            sharedPreferences
                                                .getDouble("longitude")!
                                                .toDouble()),
                                        infoWindow: const InfoWindow(
                                          title: "Hi",

                                          /// TODO : Fetch user name
                                          snippet: "Mohamed",
                                        ),
                                      )
                                    },
                                  ),
                                ),

                                Positioned(
                                  top: media.height * .025,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: media.width * .06),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          "hello Mohamed",
                                        ),
                                        SizedBox(
                                          height: media.height * .01,
                                        ),
                                        CustomText(
                                          "Here is Map",
                                          isBold: false,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  
                                  Text("clear sky",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: media.width * .05,
                                          fontFamily: "poppins")),
                                  Text("weather",
                                      style: TextStyle(
                                          color: Colors.white38,
                                          fontSize: media.width * .04,
                                          fontFamily: "inter")),
                                  SizedBox(
                                    height: media.height * .02,
                                  ),
                                  Text("3.09",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: media.width * .05,
                                          fontFamily: "poppins")),
                                  Text("wind speed",
                                      style: TextStyle(
                                          color: Colors.white38,
                                          fontSize: media.width * .04,
                                          fontFamily: "inter")),

                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                expandedHeight: media.height * .3,
              ),
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
                          CustomText("News"),
                          const Spacer(),
                          TextButton(
                              onPressed: () {
                                /// TODO : --------
                              },
                              child: CustomText(
                                "View All",
                                isBold: false,
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
                              child: CustomText("All News"),
                            ),
                            Tab(
                              child: CustomText("Sports"),
                            ),
                            Tab(
                              child: CustomText("Weather"),
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
