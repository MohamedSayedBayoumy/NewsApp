import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/core/widgets/custom_textfiled/text_filed.dart';

class WeatherSearchScreen extends StatelessWidget {
  const WeatherSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        toolbarHeight: media.height * .08,
        title: CustomTextField(controller: TextEditingController()),
        backgroundColor: Colors.yellowAccent,
      ),
    );
  }
}
