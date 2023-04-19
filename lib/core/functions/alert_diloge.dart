import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../global/globals.dart';
import '../widgets/custom_button/custom_button.dart';

alertDialogMessage(BuildContext context) async =>await showDialog<String>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return WillPopScope(
              onWillPop: () {
                exit(0);
              },
              child: AlertDialog(
                backgroundColor: Colors.black,
                title: Text(
                  AppLocalizations.of(context)!.notice,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * .06,
                      color: Colors.amber,
                      fontFamily:
                          sharedPreferences.getString("Localization") == "en"
                              ? "poppins"
                              : "arabic"),
                ),
                content: SizedBox(
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
                        height: MediaQuery.of(context).size.height * .02,
                      ),
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
                actions: <Widget>[
                  Center(
                    child: CustomButton(
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
                ],
              ),
            );
          },
        );