import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../custom_text/text.dart';

class CustomArticlePost extends StatelessWidget {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
 
  final void Function()? onPressedUrl;

  const CustomArticlePost(
      {this.author,
      
      this.description,
      this.publishedAt,
      this.title,
      this.url,
      this.urlToImage,
      this.onPressedUrl,
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
                            text: author,
                            style: Theme.of(context).textTheme.bodySmall),
                        CustomText(
                            textAlign: TextAlign.start,
                            text: publishedAt,
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: media.height * .01,
                ),
                CustomText(
                    textAlign: TextAlign.start,
                    text: title,
                    style: Theme.of(context).textTheme.bodySmall),
                SizedBox(
                  height: media.height * .01,
                ),
                CustomText(
                    textAlign: TextAlign.start,
                    text: description,
                    style: Theme.of(context).textTheme.bodySmall),
                SizedBox(
                  height: media.height * .01,
                ),
                TextButton(
                    onPressed: onPressedUrl,
                    child: Text(
                      url?.toString() ?? "",
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
