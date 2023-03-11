import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/core/core_components/custom_text/text.dart';

import '_intro_screens/screens/controller/intro_bloc.dart';
import '_intro_screens/screens/controller/intro_state.dart';
import 'core/services/services_locator.dart';

class Test3 extends StatelessWidget {
  const Test3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<IntroScreensBloc>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  bloc.add(ChangeLocalizationEvent(context: context));
                },
                child: const Text("change language")),
            TextButton(
                onPressed: () {
                  bloc.add(ChangeThemeModeEvent());
                },
                child: const Text("change Theme")),
          ],
        ),
      ),
    );
  }
}
