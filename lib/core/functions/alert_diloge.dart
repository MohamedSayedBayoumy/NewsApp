import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';

import '../global/globals.dart';
import '../widgets/custom_button/custom_button.dart';

alertDialogMessage(BuildContext context, {Widget? loading}) async =>
    await showDialog<String>(
      context: context,
      barrierDismissible: loading == null ? false : true,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: loading == null
              ? () {
                  exit(0);
                }
              : () async {
                  return true;
                },
          child: AlertDialog(
            backgroundColor: Colors.black,
            title: loading == null
                ? Text(
                    AppLocalizations.of(context)!.notice,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * .06,
                        color: Colors.amber,
                        fontFamily:
                            sharedPreferences.getString("Localization") == "en"
                                ? "poppins"
                                : "arabic"),
                  )
                : null,
            content: loading ??
                SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/settings.png",
                        height: MediaQuery.of(context).size.height * .08,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .02),
                      Text(
                        textAlign: TextAlign.center,
                        AppLocalizations.of(context)!.messageNotice,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * .03,
                            color: Colors.white,
                            fontFamily:
                                sharedPreferences.getString("Localization") ==
                                        "en"
                                    ? "poppins"
                                    : "arabic"),
                      ),
                    ],
                  ),
                ),
            actions: loading == null
                ? <Widget>[
                    Center(
                      child: customButton(
                        context: context,
                        backgroundColor: const Color.fromARGB(255, 13, 233, 21),
                        child: Text(
                          textAlign: TextAlign.center,
                          AppLocalizations.of(context)!.setting,
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * .03,
                              color: Colors.white,
                              fontFamily:
                                  sharedPreferences.getString("Localization") ==
                                          "en"
                                      ? "poppins"
                                      : "arabic"),
                        ),
                        onPressed: () {
                          AppSettings.openAppSettings().then((value) {
                            exit(0);
                          });
                        },
                      ),
                    ),
                  ]
                : [],
          ),
        );
      },
    );

loading(BuildContext context, {required bool changeLoading}) =>
    alertDialogMessage(
      context,
      loading: Container(
          height: 150,
          width: 150,
          alignment: Alignment.center,
          child: AnimatedCrossFade(
              excludeBottomFocus: false,
              firstChild: const Center(
                child: CircularProgressIndicator(
                    backgroundColor: Colors.white, color: Colors.amber),
              ),
              secondChild: Lottie.asset(
                  "assets/animation_image/on_boarding/Gpay Tick.json"),
              crossFadeState: changeLoading == false
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 400))),
    );
