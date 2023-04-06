import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../custom_button/custom_button.dart';
import '../custom_text/text.dart';

class CustomError extends StatelessWidget {
  final void Function()? onPressed ;
  const CustomError({required this.onPressed,super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: "Check your connection"),
                    CustomButton(
                      onPressed: onPressed ,
                      text: "Refresh",
                    )
                  ],
                ),
              );
  }
}