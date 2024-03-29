// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:translator/translator.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../core/functions/alert_diloge.dart';
import '../../../core/widgets/custom_error/error_widget.dart';
import '../../../core/widgets/custom_post/article_post.dart';
import '../../../core/widgets/custom_user_image/user_image.dart';
import '../news_controller/bloc/articles_bloc.dart';
import '../news_controller/bloc/articles_event.dart';
import '../news_controller/bloc/articles_state.dart';
import '../../../core/global/globals.dart';
import '../../../core/utils/enum.dart';
import '../../../core/widgets/custom_text/text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsArticleScreen extends StatefulWidget {
  const NewsArticleScreen({super.key});

  @override
  State<NewsArticleScreen> createState() => _NewsArticleScreenState();
}

class _NewsArticleScreenState extends State<NewsArticleScreen> {
  final scrollController = ScrollController();
  List<Translation> listOfTranslation = [];
  @override
  void initState() {
    super.initState();

    scrollController.addListener(loading);

    if (sharedPreferences.getBool("permissionIsDeniedForever") == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        alertDialogMessage(context);
      });
    } else {
      print("Changed Permissions");
    }
  }

  void loading() async {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    if (currentScroll >= (maxScroll * 0.8)) {
      context.read<ArticlesBloc>().add(FetchArticleDataEvent());
    }
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(loading)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final bloc = BlocProvider.of<ArticlesBloc>(context);

    return ListView(children: [
      AppBar(
        toolbarHeight: media.height * .08,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomText(
            fontSize: media.width * .04,
            text: sharedPreferences.getString("Localization") == "en"
                ? DateFormat.MMMMEEEEd('en').format(DateTime.now()).toString()
                : DateFormat.MMMMEEEEd('ar').format(DateTime.now()).toString(),
          ),
          CustomText(
              fontSize: media.width * .04,
              text:
                  "${AppLocalizations.of(context)!.welcome} ${sharedPreferences.getString("name")!.split(" ").first} ,"),
        ]),
        actions: [
          IconButton(
              onPressed: () async {},
              icon: UserImage(
                backGroundColor: Colors.amber,
                backGroundRadius: media.height * .015,
              )),
        ],
      ),
      RefreshIndicator(
        backgroundColor: Colors.white,
        color: Colors.green,
        onRefresh: () async {
          return bloc.add(FetchArticleDataEvent(refrash: true));
        },
        child: SizedBox(
          height: media.height * .8,
          child: BlocBuilder<ArticlesBloc, ArticlesState>(
            builder: (context, state) {
              switch (state.request!) {
                case Request.noAction:
                  return Container();
                case Request.loading:
                  return loadingArticles(media: media);
                case Request.loaded:
                  return ListView.builder(
                      controller: scrollController,
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.noMorePosts
                          ? state.articlesModel.length
                          : state.articlesModel.length + 1,
                      itemBuilder: (context, index) {
                        if (index >= state.articlesModel.length) {
                          return loadingArticles(media: media);
                        } else {
                          final url =
                              state.articlesModel[index].url?.toString();
                          return CustomArticlePost(
                            author:
                                state.articlesModel[index].author?.toString() ??
                                    "User",
                            publishedAt: state.articlesModel[index].publishedAt
                                .toString()
                                .split("T")
                                .first,
                            title: state.articlesModel[index].title ?? "",
                            description: state.articlesModel[index].description,
                            translateMethod: () {
                              BlocProvider.of<ArticlesBloc>(context).add(
                                  TranslateArticleDataEvent(
                                      context: context,
                                      indexItem: index,
                                      title: state.articlesModel[index].title,
                                      description: state
                                          .articlesModel[index].description));
                            },
                            isLoading:
                                state.index == index ? state.isLoading : false,
                            showTranslation: state.index == index
                                ? state.showTranslation
                                : false,
                            translateTitle:
                                state.index == index ? state.titleAr : "",
                            translateDescription: state.index == index
                                ? state.descripationAr
                                : "",
                            urlToImage: state.articlesModel[index].urlToImage
                                .toString(),
                            url: url ?? "",
                            onPressedUrl: () async {
                              if (await canLaunchUrlString(url.toString())) {
                                launchUrlString(url.toString(),
                                    mode: LaunchMode
                                        .externalNonBrowserApplication);
                              }
                            },
                          );
                        }
                      });
                case Request.offline:
                  return SizedBox(
                    child: Column(
                      children: [
                        SizedBox(
                          height: media.height * .7,
                          child: ListView.builder(
                              itemCount: state.localData.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    CustomArticlePost(
                                      author: state.localData[index]
                                              ["author"] ??
                                          "",
                                      description: state.localData[index]
                                              ["description"] ??
                                          "",
                                      publishedAt: state.localData[index]
                                              ["publishedAt"]
                                          .toString()
                                          .split("T")
                                          .first,
                                      title:
                                          state.localData[index]["title"] ?? "",
                                      urlToImage: state.localData[index]
                                              ["urlToImage"] ??
                                          "".toString(),
                                      url: state.localData[index]["url"] ?? "",
                                      onPressedUrl: () {},
                                    ),
                                  ],
                                );
                              }),
                        ),
                        CustomText(
                            color: Colors.red,
                            text: AppLocalizations.of(context)!
                                .checkYourConnections),
                      ],
                    ),
                  );
                case Request.error:
                  final bloc = BlocProvider.of<ArticlesBloc>(context);
                  return CustomError(
                    onPressed: () => bloc.add(FetchArticleDataEvent(from: 0)),
                  );
              }
            },
          ),
        ),
      )
    ]);
  }
}

loadingArticles({final Size? media}) => Shimmer.fromColors(
    baseColor: Colors.white24,
    highlightColor: Colors.grey,
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: media!.width * .03,
          ),
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: media.width * .09,
                          height: media.width * .09,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300.withOpacity(.5),
                              shape: BoxShape.circle),
                        ),
                        SizedBox(
                          width: media.width * .01,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: media.width,
                                height: media.height * .03,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300.withOpacity(.5),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              SizedBox(
                                height: media.height * .01,
                              ),
                              Container(
                                width: media.width * .25,
                                height: media.height * .026,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300.withOpacity(.5),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: media.height * .01,
                    ),
                    Container(
                      width: media.width,
                      height: media.height * .03,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300.withOpacity(.5),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    SizedBox(
                      height: media.height * .01,
                    ),
                    Container(
                      width: media.width,
                      height: media.height * .08,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300.withOpacity(.5),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    SizedBox(
                      height: media.height * .01,
                    ),
                    Row(
                      children: [
                        Container(
                          width: media.width * .25,
                          height: media.height * .026,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300.withOpacity(.5),
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        SizedBox(
                          width: media.width * .012,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: media.height * .01,
                    ),
                    Container(
                      width: media.width,
                      height: media.height * .2,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300.withOpacity(.5),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ],
                ),
              )),
        ),
      ],
    ));
