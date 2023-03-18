import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/_authenticator/presentation/auth_controller/auth_state.dart';
import 'package:news_app_clean_architecture/core/core_components/custom_button/custom_button.dart';
import 'package:news_app_clean_architecture/core/core_components/custom_text/text.dart';
import 'package:news_app_clean_architecture/core/core_components/custom_textfiled/text_filed.dart';

import '../../../core/global/globals.dart';
import '../../../core/services/services_locator.dart';
import '../auth_controller/auth_bloc.dart';
import '../auth_controller/auth_event.dart';

class AddPhoneScreen extends StatelessWidget {
  const AddPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return BlocProvider<AuthBloc>(
      create: (context) => sl<AuthBloc>(),
      child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        final bloc = BlocProvider.of<AuthBloc>(context);
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Add Your Phone",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "poppins",
                    fontSize: 20),
              ),
              CustomText(
                "Please sure",
                isBold: false,
              ),
              SizedBox(
                height: media.height * .03,
              ),
              CustomTextField(
                styleBorder: OutlineInputBorder(),
                  labelText: "Phone Number",
                  hinText: "+20",
                  controller: bloc.state.phoneController),
              CustomButton(
                onPressed: () {
                  bloc.add(AddPhoneNumberEvent(
                      phoneNumber: bloc.state.phoneController.text,
                      context: context));
                },
                text: "Add",
              )
            ],
          ),
        );
      }),
    );
  }
}
