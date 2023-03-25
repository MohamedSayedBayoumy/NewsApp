import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:news_app_clean_architecture/core/widgets/custom_text/text.dart';

import '../../../core/global/globals.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
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

    return SliverAppBar(
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
                          onMapCreated: (GoogleMapController controller) async {
                            await controller.animateCamera(
                                CameraUpdate.newCameraPosition(CameraPosition(
                                    target: LatLng(
                                        sharedPreferences
                                            .getDouble("latitude")!
                                            .toDouble(),
                                        sharedPreferences
                                            .getDouble("longitude")!
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
                              icon: BitmapDescriptor.defaultMarkerWithHue(
                                  BitmapDescriptor.hueOrange),
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
                          margin: EdgeInsets.only(left: media.width * .06),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "hello Mohamed",
                              ),
                              SizedBox(
                                height: media.height * .01,
                              ),
                              CustomText(
                                text: "Here is Map",
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
    );
  }
}
