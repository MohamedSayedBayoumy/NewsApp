import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../custom_text/text.dart';

class CustomArticlePost extends StatelessWidget {
  final String? author;
  final String? title;
  final String? translateTitle;
  final String? description;
  final String? translateDescription;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final bool? showTranslation;
  final bool? isLoading;

  final void Function()? onPressedUrl;
  final void Function()? translateMethod;

  const CustomArticlePost(
      {this.author,
      this.isLoading,
      this.translateTitle,
      this.translateDescription,
      this.showTranslation,
      this.description,
      this.publishedAt,
      this.title,
      this.url,
      this.urlToImage,
      this.onPressedUrl,
      this.translateMethod,
      super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: media.width * .03, vertical: media.height * .006),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          fontSize: media.width * .03,
                          text: author!.length > 30
                              ? author!.split(',').first
                              : author!.isEmpty
                                  ? "User"
                                  : author,
                          needDefaultStyle: true,
                        ),
                        CustomText(
                          fontSize: media.width * .03,
                          text: publishedAt,
                          needDefaultStyle: true,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: media.height * .01,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    needDefaultStyle: true,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.start,
                    text: title,
                    fontSize: media.width * .035,
                  ),
                ),
                SizedBox(
                  height: media.height * .01,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    needDefaultStyle: true,
                    textDirection: TextDirection.ltr,
                    text: description,
                    fontSize: media.width * .03,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: media.height * .01,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: translateMethod,
                      child: CustomText(
                        textAlign: TextAlign.start,
                        text: AppLocalizations.of(context)!.translate,
                        color: const Color.fromARGB(255, 187, 186, 186),
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width: media.width * .012,
                    ),
                    isLoading == true
                        ? SizedBox(
                            height: media.height * .01,
                            width: media.height * .01,
                            child: CircularProgressIndicator(
                              strokeWidth: 1,
                              backgroundColor:
                                  Colors.grey.shade300.withOpacity(.5),
                              color: Colors.white,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
                SizedBox(
                  height: media.height * .01,
                ),
                AnimatedCrossFade(
                    firstChild: Container(),
                    secondChild: Padding(
                      padding: EdgeInsets.only(bottom: media.height * .01),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: media.width * .011),
                        decoration: const BoxDecoration(
                            border:
                                Border(right: BorderSide(color: Colors.black))),
                        child: CustomText(
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          needDefaultStyle: true,
                          fontSize: media.width * .07,
                          text: "$translateTitle \n $translateDescription",
                        ),
                      ),
                    ),
                    crossFadeState: showTranslation == true
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 800)),
                Container(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                      onPressed: onPressedUrl,
                      child: Text(
                        url?.toString() ?? "",
                        textDirection: TextDirection.ltr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: media.width * .04,
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline,
                        ),
                      )),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: urlToImage.toString(),
                    placeholder: (context, url) => SizedBox(
                      height: media.height * .06,
                      child: Center(
                          child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.yellowAccent,
                        backgroundColor: Colors.black.withOpacity(.2),
                      )),
                    ),
                    errorWidget: (context, url, error) => const SizedBox(
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
