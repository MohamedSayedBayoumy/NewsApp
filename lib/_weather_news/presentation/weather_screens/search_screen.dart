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
                  enabledColor: Colors.amber,
                  borderColor: Colors.amber,
                  enabledCurveBorder: 50.0,
                  textInputAction: TextInputAction.search,
                  onFieldSubmitted: (value) {
                    bloc.add(FetchWeatherDataByCountryNameEvent(
                        context: context,
                        country: value.toString().toLowerCase()));
                    return null;
                  },
                  controller: state.searchController,
                  hinText: AppLocalizations.of(context)!.searchByCountryname),
              backgroundColor: Colors.amber,
            ),
            body: Builder(
              builder: (context) {
                switch (state.statusRequest) {
                  case Request.loading:
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.amber),
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
                            color: Colors.amber.shade200.withOpacity(.5),
                          ),
                          SizedBox(
                            height: media.height * .03,
                          ),
                          CustomText(
                            text: AppLocalizations.of(context)!
                                .startSearchByCountryname,
                            fontSize: media.width * .04,
                            color: Colors.amber.shade200.withOpacity(.5),
                          ),
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
                              text: AppLocalizations.of(context)!.weatherstatus,
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
                                      text:
                                          weatherData.statusWeather.toString(),
                                    )
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
