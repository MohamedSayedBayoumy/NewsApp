import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/_articles_news/presentation/news_controller/bloc/articles_bloc.dart';
import 'package:news_app_clean_architecture/_articles_news/presentation/news_controller/bloc/articles_event.dart';
import 'package:news_app_clean_architecture/_articles_news/presentation/news_controller/bloc/articles_state.dart';
import 'package:news_app_clean_architecture/core/widgets/custom_text/text.dart';

import '../../../core/services/services_locator.dart';
import '../../../core/utils/enum.dart';

class NewsArticleScreen extends StatelessWidget {
  const NewsArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => sl<ArticlesBloc>()..add(FetchArticleDataEvent()),
      child: BlocBuilder<ArticlesBloc, ArticlesState>(
        builder: (context, state) {
          switch (state.request!) {
            case Request.loading:
              return Center(
                child: CircularProgressIndicator(color: Colors.amberAccent),
              );
            case Request.loaded:
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.articlesModel!.articles!.length,
              itemBuilder: (context, index) {
                String date = state.articlesModel!.articles![index].publishedAt
                    .toString();
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: media.width * .03,
                      vertical: media.height * .006),
                  child: Container(
                      width: media.width,
                      height: media.height * .47,
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
                                Image.asset(
                                  "assets/images/profile.png",
                                  width: media.width * .09,
                                ),
                                SizedBox(
                                  width: media.width * .01,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                        text: state.articlesModel!
                                                .articles![index].author ??
                                            "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                    CustomText(
                                        textAlign: TextAlign.start,
                                        text: date.split("T").first,
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
                                text: state.articlesModel!.articles![index]
                                        .title ??
                                    "",
                                style: Theme.of(context).textTheme.bodySmall),
                            SizedBox(
                              height: media.height * .01,
                            ),
                            CustomText(
                                textAlign: TextAlign.start,
                                text: state.articlesModel!.articles![index]
                                        .description ??
                                    "",
                                style: Theme.of(context).textTheme.bodySmall),
                            SizedBox(
                              height: media.height * .01,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  state.articlesModel!.articles![index].url ??
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
                            state.articlesModel!.articles![index].urlToImage !=
                                    null
                                ? Image.network(
                                    state.articlesModel!.articles![index]
                                        .urlToImage
                                        .toString(),
                                  )
                                : const Text("")
                          ],
                        ),
                      )),
                );
              });
            case Request.error:
            return const Text("Error") ;
          }
          
        },
      ),
    );
  }
}
