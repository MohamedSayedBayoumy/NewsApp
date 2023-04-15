import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/services_locator.dart';
import '../../../core/utils/api_constance.dart';
import '../../../core/utils/enum.dart';
import '../../../core/widgets/custom_text/text.dart';
import '../../../core/widgets/custom_textfiled/text_filed.dart';
import '../weather_controller/bloc/weather_bloc.dart';
import '../weather_controller/bloc/weather_event.dart';
import '../weather_controller/bloc/weather_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class WeatherSearchScreen extends StatelessWidget {
  const WeatherSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => sl<WeatherBloc>(),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<WeatherBloc>(context);
          return Scaffold(
            appBar: AppBar(
              leading: const BackButton(
                color: Colors.black,
              ),
              toolbarHeight: media.height * .08,
              title: CustomTextField(
                  textInputAction: TextInputAction.search,
                  onFieldSubmitted: (value) {
                    bloc.add(FetchWeatherDataByCountryNameEvent(
                        context: context,
                        country: value.toString().toLowerCase()));
                    return null;
                  },
                  controller: state.searchController,
                  hinText: "Search by country name"),
              backgroundColor: Colors.yellowAccent,
            ),
            body: Builder(
              builder: (context) {
                switch (state.statusRequest) {
                  case Request.loading:
                    return const Center(
                      child:
                          CircularProgressIndicator(color: Colors.yellowAccent),
                    );
                  case Request.noAction:
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/search.png",
                            height: media.width * .20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: media.height * .03,
                          ),
                          CustomText(
                              text: AppLocalizations.of(context)!
                                              .searchByCountryname,
                              style: const TextStyle(
                                  fontFamily: "poppins",
                                  fontSize: 10.0,
                                  color: Color.fromARGB(255, 148, 141, 80))),
                        ],
                      ),
                    );
                  case Request.loaded:
                    final weatherData = state.weatherModel!.weather![0];
                    final weatherState = state.weatherModel;
                    return Center(
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
                              text:  AppLocalizations.of(context)!
                                              .weatherstatus,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                    );
                  case Request.offline:
                    return Center(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: media.width * .04),
                        child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white30.withOpacity(.5),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: media.width * .03,
                            ),
                            width: media.width,
                            height: media.height * .12,
                            child: CustomText(
                                text: state.message.toString(),
                                style: Theme.of(context).textTheme.bodySmall)),
                      ),
                    );
                  case Request.error:
                    return Container();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
