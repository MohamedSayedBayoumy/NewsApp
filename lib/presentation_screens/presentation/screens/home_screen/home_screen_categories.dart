
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../_articles_news/presentation/news_screens/news_article_screen.dart';
import '../../../../core/global/globals.dart';
import '../../../../core/widgets/custom_text/text.dart';

// ignore: must_be_immutable
class MyStatelessWidget extends StatefulWidget {
  const MyStatelessWidget({super.key});

  static List<Widget> views = const [
    NewsArticleScreen(),
    NewsArticleScreen(),
    NewsArticleScreen(),
  ];

  @override
  State<MyStatelessWidget> createState() => _MyStatelessWidgetState();
}

class _MyStatelessWidgetState extends State<MyStatelessWidget> {
  List<String> tabs = ["News", "Weather", "Sport"];

  String themeMap = "";

  @override
  void initState() {
    DefaultAssetBundle.of(context).loadString("assets/map.json").then((value) {
      themeMap = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: media.height * .08,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomText(
            text: DateFormat.MMMMEEEEd().format(DateTime.now()).toString(),
          ),
          CustomText(
              text:
                  "Welcome ${sharedPreferences.getString("name")!.split(" ").first} ,"),
        ]),
        actions: [
          IconButton(
              onPressed: () async {},
              icon: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/image_profile.jpg"),
              )),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: media.height * .01),
        child: DefaultTabController(
          length: tabs.length,
          child: TabBarView(
            physics: const BouncingScrollPhysics(),
            children: MyStatelessWidget.views,
          ),
        ),
      ),
    );
  }
}
