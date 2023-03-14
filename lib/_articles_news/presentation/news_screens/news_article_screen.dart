import 'package:flutter/material.dart';

class NewsArticleScreen extends StatelessWidget {
  const NewsArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return   ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(
              horizontal: media.width * .03, vertical: media.height * .006),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .23,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(80),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.6),
                  offset: const Offset(
                    0.0,
                    10.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: -6.0,
                ),
              ],
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.35),
                  BlendMode.multiply,
                ),
                image: const NetworkImage(
                    'https://www.practicalecommerce.com/wp-content/uploads/2023/02/Tools-to-Create-and-Optimize-Meta-Descriptions.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.topLeft,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .24,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(80),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [
                    0.1,
                    0.4,
                    0.6,
                    0.9,
                  ],
                  colors: [
                    Colors.black45,
                    Colors.black38.withOpacity(.2),
                    Colors.white.withOpacity(.1),
                    Colors.white.withOpacity(.2),
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: media.width * .05,
                    top: media.height * .04,
                    right: media.width * .05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                          width: media.width * .5,
                          alignment: Alignment.center,
                          child: Text(
                            "Tools to Create, Optimize Meta Descriptions",
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "interBold",
                                fontSize: media.width * .04),
                          )),
                    ),
                    SizedBox(
                        width: media.width * .5,
                        child: Text(
                          "Ann Smarty",
                          maxLines: 2,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white60,
                              fontFamily: "inter",
                              fontSize: media.width * .04),
                        )),
                    Expanded(
                      child: SizedBox(
                          width: media.width * .5,
                          child: Text(
                            "2023-02-16T 13:54:52Z",
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white60,
                                fontFamily: "inter",
                                fontSize: media.width * .04),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }
}
