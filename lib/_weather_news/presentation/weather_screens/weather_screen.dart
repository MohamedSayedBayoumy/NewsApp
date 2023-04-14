//

// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:news_app_clean_architecture/_weather_news/presentation/weather_controller/bloc/weather_state.dart';
import 'package:news_app_clean_architecture/_weather_news/presentation/weather_screens/search_screen.dart';
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

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
            preferredSize: Size(0, media.height * .03), child: Container()),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
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
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              compassEnabled: false,
              zoomControlsEnabled: false,
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
          Positioned(
            top: media.height * .13,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: media.width * .05),
              child: fadeUpToDown(
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: media.height * .03,
                        horizontal: media.width * .01),
                    width: media.width * .9,
                    child: CustomText(
                      text: sharedPreferences.getString("address"),
                    )),
              ),
            ),
          ),
          BlocProvider(
            create: (context) =>
                sl<WeatherBloc>()..add(FetchWeatherDataEvent(context: context)),
            child: BlocBuilder<WeatherBloc, WeatherState>(
                buildWhen: (previous, current) =>
                    previous.statusRequest != current.statusRequest,
                builder: (context, state) {
                  switch (state.statusRequest) {
                    case Request.noAction:
                      return Container();
                    case Request.loading:
                      return Positioned(
                          bottom: media.height * .06,
                          child: const Center(
                            child: CircularProgressIndicator(
                                color: Colors.yellowAccent),
                          ));

                    case Request.loaded:
                      final weatherData = state.weatherModel!.weather![0];
                      final weatherState = state.weatherModel;
                      state.addressController.text =
                          sharedPreferences.getString("address").toString();
                      return Positioned(
                          bottom: media.height * .06,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: media.width * .05,
                            ),
                            child: Container(
                              width: media.width * .9,
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.5),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText(
                                    text: "Weather Statue in Your City",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
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
                                                backgroundColor: Colors.black
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
                                              text: weatherData.statusWeather
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
                                                    "WindSpeed: ${weatherState!.speedWind}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall),
                                            SizedBox(
                                              height: media.height * .03,
                                            ),
                                            CustomText(
                                                text:
                                                    "Weather Stauts: ${weatherData.description}",
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
                          ));

                    case Request.error:
                      final bloc = BlocProvider.of<WeatherBloc>(context);
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
                                borderRadius: BorderRadius.circular(25)),
                            width: media.width,
                            child: CustomError(
                              onPressed: () {
                                bloc.add(
                                    FetchWeatherDataEvent(context: context));
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
        ],
      ),
    );
  }
}
