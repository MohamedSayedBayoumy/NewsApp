// // ignore_for_file: avoid_print
//! سكرين دي بثبت ان سبب ان طريقتك شغاله صح في 

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:url_launcher/url_launcher_string.dart';

// import '../../../core/widgets/custom_error/error_widget.dart';
// import '../../../core/widgets/custom_post/article_post.dart';
// import '../../../core/widgets/custom_user_image/user_image.dart';
 
// import '../../../core/global/globals.dart';
// import '../../../core/utils/enum.dart';
// import '../../../core/widgets/custom_text/text.dart';
// import '_articles_news/presentation/news_controller/bloc/articles_bloc.dart';
// import '_articles_news/presentation/news_controller/bloc/articles_event.dart';
// import '_articles_news/presentation/news_controller/bloc/articles_state.dart';

//     //! Don't Delete it 

//! pageView هنا هجيب الداتا 5 في 5 حتي اذا بتجري و هناك في السكرين التانيه الداتا بتجي 10 عشان ال بلوك بروفيدر محطوط جوا ال 

// class NewsArticleScreens extends StatefulWidget {
//   const NewsArticleScreens({super.key});

//   @override
//   State<NewsArticleScreens> createState() => _NewsArticleScreensState();
// }

// class _NewsArticleScreensState extends State<NewsArticleScreens> {
//   final scrollController = ScrollController();


//     //! Don't Delete it 

//   @override
//   void initState() {
//     super.initState();

//     scrollController.addListener(loading);
//   }

//   void loading() async {
//     final maxScroll = scrollController.position.maxScrollExtent;
//     final currentScroll = scrollController.offset;
//     if (currentScroll >= (maxScroll * 0.9)) {
//       context.read<ArticlesBloc>().add(FetchArticleDataEvent());
//     }
//   }

//   @override
//   void dispose() {
//     scrollController
//       ..removeListener(loading)
//       ..dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final media = MediaQuery.of(context).size;

//     //! Don't Delete it 
//     return Scaffold(
//       body: ListView(children: [
//         AppBar(
//           toolbarHeight: media.height * .08,
//           backgroundColor: Colors.transparent,
//           centerTitle: false,
//           title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             CustomText(
//               text: DateFormat.MMMMEEEEd().format(DateTime.now()).toString(),
//             ),
//             CustomText(
//                 text:
//                     "Welcome ${sharedPreferences.getString("name")!.split(" ").first} ,"),
//           ]),
//           actions: [
//             IconButton(
//                 onPressed: () async {},
//                 icon: const UserImage(
//                   isAppBar: true,
//                 )),
//           ],
//         ),
//         SizedBox(
//           height: media.height * .8,
//           child: BlocBuilder<ArticlesBloc, ArticlesState>(
//             builder: (context, state) {
//               switch (state.request!) {
//                 case Request.noAction:
//                   return Container();
//                 case Request.loading:
//                   return const Center(
//                     child: CircularProgressIndicator(color: Colors.amberAccent),
//                   );
//                 case Request.loaded:
//                   return ListView.builder(
//                       controller: scrollController,
                       
//                       itemCount: state.noMorePosts
//                           ? state.articlesModel.length
//                           : state.articlesModel.length + 1,
//                       itemBuilder: (context, index) {
//                         if (index >= state.articlesModel.length) {
//                           return Padding(
//                             padding: EdgeInsets.symmetric(
//                                 vertical: media.height * .03),
//                             child: const Center(
//                                 child: CircularProgressIndicator(
//                               color: Colors.yellow,
//                             )),
//                           );
//                         } else {
//                           final url = state.articlesModel[index].url?.toString();
    
//                           return CustomArticlePost(
//                             author:
//                                 state.articlesModel[index].author?.toString() ??
//                                     "User",
//                             description:
//                                 state.articlesModel[index].description ?? "",
//                             publishedAt: state.articlesModel[index].publishedAt
//                                 .toString()
//                                 .split("T")
//                                 .first,
//                             title: state.articlesModel[index].title ?? "",
//                             urlToImage:
//                                 state.articlesModel[index].urlToImage.toString(),
//                             url: url ?? "",
//                             onPressedUrl: () async {
//                               if (await canLaunchUrlString(url.toString())) {
//                                 launchUrlString(url.toString(),
//                                     mode:
//                                         LaunchMode.externalNonBrowserApplication);
//                               }
//                             },
//                           );
//                         }
//                       });
//                 case Request.offline:
//                   return ListView.builder(
//                       physics: const BouncingScrollPhysics(),
//                       itemCount: state.localData!.length,
//                       itemBuilder: (context, index) {
//                         return CustomArticlePost(
//                           author: state.localData![index]["author"] ?? "",
//                           description:
//                               state.localData![index]["description"] ?? "",
//                           publishedAt: state.localData![index]["publishedAt"]
//                               .toString()
//                               .split("T")
//                               .first,
//                           title: state.localData![index]["title"] ?? "",
//                           urlToImage: state.localData![index]["urlToImage"] ??
//                               "".toString(),
//                           url: state.localData![index]["url"] ?? "",
//                           onPressedUrl: () {},
//                         );
//                       });
//                 case Request.error:
//                   final bloc = BlocProvider.of<ArticlesBloc>(context);
//                   return CustomError(
//                     onPressed: () => bloc.add(FetchArticleDataEvent(from: 0)),
//                   );
//               }
//             },
//           ),
//         ),
//       ]),
//     );
//   }
// }
