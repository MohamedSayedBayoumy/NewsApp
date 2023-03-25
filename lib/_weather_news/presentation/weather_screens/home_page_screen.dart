import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/core/widgets/custom_text/text.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(text: "WeatherScreen"),
    );
  }
}
