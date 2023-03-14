import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import '_articles_news/presentation/news_screens/news_article_screen.dart';
import 'core/core_components/custom_text/text.dart';
import 'core/global/globals.dart';

class Test2 extends StatelessWidget {
  const Test2({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: CustomText("hi 2"),
    ));
  }

}
