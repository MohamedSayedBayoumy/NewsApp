import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_app_clean_architecture/core/widgets/custom_button/custom_button.dart';

import '../news_controller/bloc/articles_bloc.dart';
import '../news_controller/bloc/articles_event.dart';
import '../news_controller/bloc/articles_state.dart';
import '../../../core/global/globals.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/utils/enum.dart';
import '../../../core/widgets/custom_text/text.dart';
import 'package:cached_network_image/cached_network_image.dart';

 class NewsArticleScreen extends StatelessWidget {
  const NewsArticleScreen({super.key});

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
      body: BlocProvider(
        create: (context) => sl<ArticlesBloc>()..add(FetchArticleDataEvent()),
        child: BlocBuilder<ArticlesBloc, ArticlesState>(
          builder: (context, state) {
            switch (state.request!) {
              case Request.loading:
                return const Center(
                  child: CircularProgressIndicator(color: Colors.amberAccent),
                );
              case Request.loaded:
                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.articlesModel!.articles!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: media.width * .03,
                            vertical: media.height * .006),
                        child: Container(
                            width: media.width,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300.withOpacity(.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(media.width * .03),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "assets/images/profile.png",
                                        width: media.width * .09,
                                      ),
                                      SizedBox(
                                        width: media.width * .01,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                              text: state.articlesModel!
                                                      .articles![index].author
                                                      ?.toString() ??
                                                  "User",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall),
                                          CustomText(
                                              textAlign: TextAlign.start,
                                              text: state.articlesModel!
                                                  .articles![index].publishedAt
                                                  .toString()
                                                  .split("T")
                                                  .first,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: media.height * .01,
                                  ),
                                  CustomText(
                                      textAlign: TextAlign.start,
                                      text: state.articlesModel!
                                              .articles![index].title ??
                                          "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                  SizedBox(
                                    height: media.height * .01,
                                  ),
                                  CustomText(
                                      textAlign: TextAlign.start,
                                      text: state.articlesModel!
                                              .articles![index].description ??
                                          "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                  SizedBox(
                                    height: media.height * .01,
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        state.articlesModel!.articles![index]
                                                .url ??
                                            "",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: media.width * .04,
                                          color: Colors.blueAccent,
                                          decoration: TextDecoration.underline,
                                        ),
                                      )),
                                  SizedBox(
                                    height: media.height * .01,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: CachedNetworkImage(
                                      imageUrl: state.articlesModel!
                                          .articles![index].urlToImage
                                          .toString(),
                                      placeholder: (context, url) => SizedBox(
                                        height: media.height * .06,
                                        child: Center(
                                            child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.yellowAccent,
                                          backgroundColor:
                                              Colors.black.withOpacity(.2),
                                        )),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const SizedBox(
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      );
                    });
              case Request.error:
                final bloc = BlocProvider.of<ArticlesBloc>(context);
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(text: "Check your connection"),
                      CustomButton(
                        onPressed: () {
                          bloc.add(FetchArticleDataEvent());
                        },
                        text: "Refresh",
                      )
                    ],
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
