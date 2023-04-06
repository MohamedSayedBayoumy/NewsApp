//

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
import '../../../core/widgets/custom_button/custom_button.dart';
import '../../../core/widgets/custom_do_animtion/custom_fade_animation.dart';
import '../../../core/widgets/custom_error/error_widget.dart';
import '../../../core/widgets/custom_text/text.dart';
import '../../../core/widgets/custom_textfiled/text_filed.dart';
import '../weather_controller/bloc/weather_bloc.dart';
import '../weather_controller/bloc/weather_event.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          sl<WeatherBloc>()..add(FetchWeatherDataEvent(context: context)),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          switch (state.statusRequest) {
            case Request.loading:
              return const Center(
                child: CircularProgressIndicator(color: Colors.yellowAccent),
              );

            case Request.loaded:
              final weatherData = state.weatherModel!.weather![0];
              final weatherState = state.weatherModel;
              state.addressController.text =
                  sharedPreferences.getString("address").toString();

              return Scaffold(
                extendBody: true,
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  bottom: PreferredSize(
                      preferredSize: Size(0, media.height * .03),
                      child: Container()),
                  actions: [
                    IconButton(
                      icon: const Icon(
                        Icons.search,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              child: fadeDownTOUp(
                                  child: const WeatherSearchScreen()),
                              type: PageTransitionType.rightToLeftWithFade),
                        );
                      },
                    ),
                  ],
                ),
                body: Stack(
                  children: [
                    GoogleMap(
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
                        controller.setMapStyle(state.themeMode);
                      },
                      initialCameraPosition: const CameraPosition(
                        target: LatLng(0.0, 0.0),
                        zoom: 12.0,
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
                          infoWindow: InfoWindow(
                            title: "Hi",
                            snippet: sharedPreferences
                                .getString("name")!
                                .split(" ")
                                .first,
                          ),
                        )
                      },
                    ),
                    Positioned(
                      top: media.height * .13,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: media.width * .05),
                        child: fadeUpToDown(
                          child: SizedBox(
                              width: media.width * .9,
                              child: CustomTextField(
                                  needLabel: FloatingLabelBehavior.always,
                                  enabled: false,
                                  labelText: "Location",
                                  controller: state.addressController)),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: media.height * .06,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: media.width * .05,
                        ),
                        child: Container(
                          width: media.width * .9,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white30.withOpacity(.5),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText(
                                text: "Weather Statue in Your City",
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.network(ApiConstanceWeather.urlIcon(
                                          weatherData.icon)),
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
                      ),
                    ),
                  ],
                ),
              );

            case Request.error:
              final bloc = BlocProvider.of<WeatherBloc>(context);
              return CustomError(
                onPressed: () {
                  bloc.add(FetchWeatherDataEvent(context: context));
                },
              );
          }
        },
      ),
    );
  }
}
