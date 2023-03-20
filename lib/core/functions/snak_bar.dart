import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/core/widgets/custom_text/text.dart';

SnackBar snackBar(String value) => SnackBar(
      backgroundColor: Colors.red.shade900,
      content: SizedBox(
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.info_outline_rounded , color: Colors.white),
              const SizedBox(width: 10,) ,
              CustomText(value),
            ],
          )),
    );
