import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/core/core_components/custom_text/text.dart';

class Test1 extends StatelessWidget {
  const Test1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomText("hi 1"),
      ),
    );
  }
}
