//

// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:page_transition/page_transition.dart';

import '../../../core/global/globals.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/utils/api_constance.dart';
import '../../../core/utils/enum.dart';
import '../../../core/widgets/custom_do_animtion/custom_fade_animation.dart';
import '../../../core/widgets/custom_error/error_widget.dart';
import '../../../core/widgets/custom_text/text.dart';
import '../weather_controller/bloc/weather_bloc.dart';
import '../weather_controller/bloc/weather_event.dart';
import '../weather_controller/bloc/weather_state.dart';
import 'search_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String? themeMode;
  @override
  void initState() {
    super.initState();
    DefaultAssetBundle.of(context).loadString("assets/map.json").then((value) {
      themeMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: media.height * .09,
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
            preferredSize: Size(0, media.height * .05), child: Container()),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: media.width * .03),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.black, shape: BoxShape.circle),
              child: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.yellow,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        child: const WeatherSearchScreen(),
                        type: PageTransitionType.rightToLeftWithFade),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              compassEnabled: false,
              zoomControlsEnabled: false,
              onMapCreated: (controller) {
                controller.setMapStyle(themeMode);
              },
              initialCameraPosition: CameraPosition(
                  target: LatLng(
                      sharedPreferences.getDouble("latitude")!.toDouble(),
                      sharedPreferences.getDouble("longitude")!.toDouble()),
                  zoom: 16.7,
                  tilt: 45,
                  bearing: 60),
              markers: {
                Marker(
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueOrange),
                  markerId: const MarkerId(("")),
                  position: LatLng(
                      sharedPreferences.getDouble("latitude")!.toDouble(),
                      sharedPreferences.getDouble("longitude")!.toDouble()),
                  infoWindow: InfoWindow(
                    title: "Hi",
                    snippet:
                        sharedPreferences.getString("name")!.split(" ").first,
                  ),
                )
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: media.height * .13),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                fadeOutLeft(
                  child: Padding(
                    padding: EdgeInsets.only(right: media.width * .05),
                    child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(50),
                                topRight: Radius.circular(50))),
                        width: media.width,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                width: media.width * .03,
                                height: media.height * .15,
                                decoration: const BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(50),
                                        topRight: Radius.circular(50))),
                                child: CustomText(
                                  fontSize: media.width * .04,
                                  color: Colors.white,
                                  text: AppLocalizations.of(context)!.location,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: CustomText(
                                fontSize: media.width * .04,
                                needDefaultStyle: true,
                                color: Colors.black,
                                text: sharedPreferences
                                            .getString("localization") ==
                                        "ar"
                                    ? sharedPreferences.getString("addressAr")
                                    : sharedPreferences.getString("addressEn"),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: BlocProvider(
                    create: (context) => sl<WeatherBloc>()
                      ..add(FetchWeatherDataEvent(context: context)),
                    child: BlocBuilder<WeatherBloc, WeatherState>(
                        buildWhen: (previous, current) =>
                            previous.statusRequest != current.statusRequest,
                        builder: (context, state) {
                          switch (state.statusRequest) {
                            case Request.noAction:
                              return Container();
                            case Request.loading:
                              return const Center(
                                child: CircularProgressIndicator(
                                    color: Colors.yellowAccent),
                              );

                            case Request.loaded:
                              final weatherData =
                                  state.weatherModel!.weather![0];
                              final weatherState = state.weatherModel;

                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: media.width * .04,
                                ),
                                child: Container(
                                  width: media.width * .9,
                                  height: media.height,
                                  decoration: BoxDecoration(
                                    // color: ,
                                    gradient: LinearGradient(colors: [
                                      Colors.black12,
                                      Colors.amber.withOpacity(.5)
                                    ]),
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomText(
                                        text: AppLocalizations.of(context)!
                                            .weatherStatueinYourlocation,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CachedNetworkImage(
                                                imageUrl:
                                                    ApiConstanceWeather.urlIcon(
                                                        weatherData.icon),
                                                placeholder: (context, url) =>
                                                    SizedBox(
                                                  height: media.height * .06,
                                                  child: Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                    strokeWidth: 2,
                                                    color: Colors.yellowAccent,
                                                    backgroundColor: Colors
                                                        .black
                                                        .withOpacity(.2),
                                                  )),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const SizedBox(
                                                  height: 0,
                                                ),
                                              ),
                                              CustomText(
                                                  text: weatherData
                                                      .statusWeather
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall)
                                            ],
                                          )),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomText(
                                                    text:
                                                        "${AppLocalizations.of(context)!.windSpeed}: ${weatherState!.speedWind}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall),
                                                SizedBox(
                                                  height: media.height * .03,
                                                ),
                                                CustomText(
                                                    text:
                                                        "${AppLocalizations.of(context)!.weatherstatus}: ${weatherData.description}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );

                            case Request.error:
                              final bloc =
                                  BlocProvider.of<WeatherBloc>(context);
                              return Positioned(
                                bottom: media.height * .06,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: media.width * .05,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: media.height * .03),
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(.5),
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    width: media.width,
                                    child: CustomError(
                                      onPressed: () {
                                        bloc.add(FetchWeatherDataEvent(
                                            context: context));
                                      },
                                    ),
                                  ),
                                ),
                              );
                            case Request.offline:
                              return Container();
                          }
                        }),
                  ),
                ),
              ],
            ),
          ),
          // Positioned(
          //   top: media.height * .13,
          //   // right: media.width * .03,
          //   left: media.width * .3,
          //   child:
          // ),
        ],
      ),
    );
  }
}
