// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_app_clean_architecture/_articles_news/data/local_data_base_articles/local_data_base.dart';
import 'package:news_app_clean_architecture/_articles_news/data/news_remote_data_source/remte_data_articles.dart';
import 'package:news_app_clean_architecture/_articles_news/domain/news_base_repository/base_repository_articles.dart';

import '../../../core/widgets/custom_post/article_post.dart';
import '../../data/news_repository_data/repository_data_articles.dart';
import '../../domain/news_base_use_case/use_case_aritcles.dart';
import '../news_controller/bloc/articles_bloc.dart';
import '../news_controller/bloc/articles_event.dart';
import '../news_controller/bloc/articles_state.dart';
import '../../../core/global/globals.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/utils/enum.dart';
import '../../../core/widgets/custom_text/text.dart';

class NewsArticleScreen extends StatefulWidget {
  const NewsArticleScreen({super.key});

  @override
  State<NewsArticleScreen> createState() => _NewsArticleScreenState();
}

class _NewsArticleScreenState extends State<NewsArticleScreen> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(fetchMoreData);
  }

  void fetchMoreData() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      print("object");
    } else {
      print("object2");
    }
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
              onPressed: () async {
                BaseLocalArticlesData baseLocalArticlesData =
                    LocalArticlesData();

                BaseRemoteArticlesData baseRemoteArticlesData =
                    RemoteArticlesData();
                BaseRepositoryArticles baseRepositoryArticles =
                    RepositoryDataArticles(
                        baseLocalArticlesData: baseLocalArticlesData,
                        baseRemoteArticlesData: baseRemoteArticlesData);
                UseCaseArticles useCaseArticles = UseCaseArticles(
                    baseRepositoryArticles: baseRepositoryArticles);

                List articles = await useCaseArticles.getLocalArticlesData();

                print(articles[0]["author"]);
              },
              icon: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/image_profile.jpg"),
              )),
        ],
      ),
      body: BlocProvider(
        create: (context) => sl<ArticlesBloc>()..add(FetchArticleDataEvent()),
        child: BlocBuilder<ArticlesBloc, ArticlesState>(
          buildWhen: (previous, current) => previous.request != current.request,
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
                    controller: controller,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return CustomArticlePost(
                        author: state.articlesModel!.articles![index].author
                                ?.toString() ??
                            "User",
                        description:
                            state.articlesModel!.articles![index].description ??
                                "",
                        publishedAt: state
                            .articlesModel!.articles![index].publishedAt
                            .toString()
                            .split("T")
                            .first,
                        title:
                            state.articlesModel!.articles![index].title ?? "",
                        urlToImage: state
                            .articlesModel!.articles![index].urlToImage
                            .toString(),
                        url: state.articlesModel!.articles![index].url ?? "",
                        onPressedUrl: () {},
                      );
                    });
              case Request.error:
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
            }
          },
        ),
      ),
    );
  }
}
