import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreenCategories extends StatelessWidget {
  const HomeScreenCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: media.width * .14, vertical: media.height * .02),
        child: Container(
          width: media.width,
          height: media.height * .05,
          padding: EdgeInsets.symmetric(horizontal: media.width * .02),
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){}, icon: Image.asset("assets/bottom_navigate_icons/newspaper.png"))
            ],
          ),
        ),
      )),
    );
  }
}
