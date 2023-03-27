import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/_weather_news/presentation/weather_controller/bloc/weather_bloc.dart';
import 'package:news_app_clean_architecture/_weather_news/presentation/weather_controller/bloc/weather_event.dart';
import 'package:news_app_clean_architecture/_weather_news/presentation/weather_controller/bloc/weather_state.dart';
import 'package:news_app_clean_architecture/core/widgets/custom_text/text.dart';
import 'package:news_app_clean_architecture/core/widgets/custom_textfiled/text_filed.dart';

import '../../../core/services/services_locator.dart';
import '../../../core/utils/enum.dart';

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
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/search.png",
                            height: media.width * .20,
                            color: const Color.fromARGB(255, 148, 141, 80),
                          ),
                          SizedBox(
                            height: media.height * .03,
                          ),
                          CustomText(
                              text: "Start Search By Country Name  .. .",
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
                    return Container();
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
