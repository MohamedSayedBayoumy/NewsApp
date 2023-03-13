import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:news_app_clean_architecture/core/core_components/custom_text/text.dart';

import 'main.dart';

late double n;
late double y;

late dynamic b;

class HomeScreenCategories extends StatefulWidget {
  const HomeScreenCategories({Key? key}) : super(key: key);

  @override
  State<HomeScreenCategories> createState() => _HomeScreenCategoriesState();
}

class _HomeScreenCategoriesState extends State<HomeScreenCategories>
    with TickerProviderStateMixin {
  late TabController _tabController = TabController(length: 3, vsync: this);

  dynamic x;

  dynamic y;

  Future<void> hi() async {
    var location = new Location();
    Location a = new Location();
    dynamic b = await a.getLocation();
    x = b.latitude;
    y = b.longitude;
    print("hi : $x");
    print("hi2 : $y");
    try {
      location.requestPermission(); //to lunch location permission popup
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        print('Permission denied');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.animateTo(0, curve: Curves.bounceOut);
  }

  static const List<Widget> _views = [
    Center(
        child: Text(
      'Content of Tab One',
      style: TextStyle(color: Colors.white),
    )),
    Center(
        child:
            Text('Content of Tab Two', style: TextStyle(color: Colors.white))),
    Center(
        child:
            Text('Content of Tab Three', style: TextStyle(color: Colors.white)))
  ];

  List<Marker> data = [];

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    LatLng x = LatLng(0.0, 0.0);
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(media.width * .03),
            child: ListView(physics: const BouncingScrollPhysics(), children: [
              Container(
                width: media.width,
                height: media.height * .3,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.1),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: media.width * .02),
                              // child: SizedBox(
                              //     width: media.width,
                              //     height: media.height,
                              //     child: GoogleMap(
                              //       onMapCreated:
                              //           (GoogleMapController controller) async {
                              //         Location a = new Location();
                              //         b = await a.getLocation();
                              //         controller.animateCamera(
                              //           CameraUpdate.newCameraPosition(
                              //             CameraPosition(
                              //                 target: LatLng(
                              //                     b.latitude, b.longitude),
                              //                 zoom: 15),
                              //           ),
                              //         );
                              //         setState(() {
                              //           data.add(Marker(
                              //               markerId: MarkerId(""),
                              //               position: LatLng(
                              //                   b.latitude, b.longitude)));
                              //         });
                              //       },
                              //       initialCameraPosition:
                              //           CameraPosition(target: x),
                              //       markers: data.toSet(),
                              //     )),
                            ),
                            Positioned(
                              top: media.height * .025,
                              child: Container(
                                margin:
                                    EdgeInsets.only(left: media.width * .06),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    const Expanded(
                        flex: 1,
                        child: Text(
                          "here fetch data from Api Current Location",
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              ),
              Row(
                children: [
                  CustomText("News"),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        hi();
                      },
                      child: CustomText(
                        "View All",
                        isBold: false,
                      )),
                ],
              ),
              DefaultTabController(
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
              Container(
                color: Colors.transparent,
                height: media.height * .06,
                width: media.width,
                child: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  controller: _tabController,
                  children: _views,
                ),
              ),
            ])));
  }
}
