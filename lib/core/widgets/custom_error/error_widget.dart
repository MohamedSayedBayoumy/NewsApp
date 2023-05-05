import 'package:flutter/material.dart';
import '../custom_button/custom_button.dart';
import '../custom_text/text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomError extends StatelessWidget {
  final void Function()? onPressed;
  const CustomError({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(text: AppLocalizations.of(context)!.checkYourConnections),
          customButton(
            context: context,
            onPressed: onPressed,
            text: "Refresh",
          )
        ],
      ),
    );
  }
}
