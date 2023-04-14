// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_app_clean_architecture/_articles_news/data/local_data_base_articles/local_data_base.dart';
import 'package:news_app_clean_architecture/_articles_news/data/news_remote_data_source/remte_data_articles.dart';
import 'package:news_app_clean_architecture/_articles_news/domain/news_base_repository/base_repository_articles.dart';

import '../../../core/widgets/custom_error/error_widget.dart';
import '../../../core/widgets/custom_post/article_post.dart';
import '../../../core/widgets/custom_user_image/user_image.dart';
import '../../data/news_repository_data/repository_data_articles.dart';
import '../../domain/news_base_use_case/use_case_aritcles.dart';
import '../news_controller/bloc/articles_bloc.dart';
import '../news_controller/bloc/articles_event.dart';
import '../news_controller/bloc/articles_state.dart';
import '../../../core/global/globals.dart';
import '../../../core/utils/enum.dart';
import '../../../core/widgets/custom_text/text.dart';

class NewsArticleScreen extends StatefulWidget {
  const NewsArticleScreen({super.key});

  @override
  State<NewsArticleScreen> createState() => _NewsArticleScreenState();
}

class _NewsArticleScreenState extends State<NewsArticleScreen> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();

    scrollController.addListener(loading);
  }

  loading() {
    if (scrollController.position.maxScrollExtent ==
        scrollController.offset) {
      context.read<ArticlesBloc>().add(FetchArticleDataEvent(
          from:
              BlocProvider.of<ArticlesBloc>(context).state.articlesModel.length,
          to: BlocProvider.of<ArticlesBloc>(context)
                  .state
                  .articlesModel
                  .length +
              11));
    }
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return ListView(children: [
      AppBar(
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
              icon: const UserImage(
                isAppBar: true,
              )),
        ],
      ),
      SizedBox(
        height: media.height * .8,
        child: BlocBuilder<ArticlesBloc, ArticlesState>(
          builder: (context, state) {
            switch (state.request!) {
              case Request.noAction:
                return Container();
              case Request.loading:
                return const Center(
                  child: CircularProgressIndicator(color: Colors.amberAccent),
                );
              case Request.loaded:
                return ListView.builder(
                    controller: scrollController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.noMorePosts
                        ? state.articlesModel.length
                        : state.articlesModel.length + 1,
                    itemBuilder: (context, index) {
                      if (index >= state.articlesModel.length) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: media.height * .03),
                          child: const Center(
                              child: CircularProgressIndicator(
                            color: Colors.yellow,
                          )),
                        );
                      } else {
                        return CustomArticlePost(
                          author:
                              state.articlesModel[index].author?.toString() ??
                                  "User",
                          description:
                              state.articlesModel[index].description ?? "",
                          publishedAt: state.articlesModel[index].publishedAt
                              .toString()
                              .split("T")
                              .first,
                          title: state.articlesModel[index].title ?? "",
                          urlToImage:
                              state.articlesModel[index].urlToImage.toString(),
                          url: state.articlesModel[index].url ?? "",
                          onPressedUrl: () {},
                        );
                      }
                    });
              case Request.offline:
                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.localData!.length,
                    itemBuilder: (context, index) {
                      return CustomArticlePost(
                        author: state.localData![index]["author"] ?? "",
                        description:
                            state.localData![index]["description"] ?? "",
                        publishedAt: state.localData![index]["publishedAt"]
                            .toString()
                            .split("T")
                            .first,
                        title: state.localData![index]["title"] ?? "",
                        urlToImage: state.localData![index]["urlToImage"] ??
                            "".toString(),
                        url: state.localData![index]["url"] ?? "",
                        onPressedUrl: () {},
                      );
                    });
              case Request.error:
                final bloc = BlocProvider.of<ArticlesBloc>(context);
                return CustomError(
                  onPressed: () =>
                      bloc.add(FetchArticleDataEvent(from: 0, to: 7)),
                );
            }
          },
        ),
      ),
    ]);
  }
}
