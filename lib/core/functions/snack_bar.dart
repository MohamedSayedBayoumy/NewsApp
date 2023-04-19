import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/core/widgets/custom_text/text.dart';

SnackBar snackBar(String value, {required BuildContext context}) => SnackBar(
      backgroundColor: Colors.red.shade900,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.info_outline_rounded, color: Colors.white),
          Expanded(
            flex: 9,
            child: Container(
              alignment: AlignmentDirectional.topStart,
              child: CustomText(
                text: value,
              ),
            ),
          ),
        ],
      ),
    );
