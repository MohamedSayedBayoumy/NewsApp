import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/_authenticator/presentation/auth_controller/auth_state.dart';
import 'package:news_app_clean_architecture/core/widgets/custom_button/custom_button.dart';
import 'package:news_app_clean_architecture/core/widgets/custom_text/text.dart';
import 'package:news_app_clean_architecture/core/widgets/custom_textfiled/text_filed.dart';

import '../../../core/services/services_locator.dart';
import '../auth_controller/auth_bloc.dart';
import '../auth_controller/auth_event.dart';

class AddPhoneScreen extends StatefulWidget {
  const AddPhoneScreen({Key? key}) : super(key: key);

  @override
  State<AddPhoneScreen> createState() => _AddPhoneScreenState();
}

class _AddPhoneScreenState extends State<AddPhoneScreen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return BlocProvider<AuthBloc>(
        create: (context) => sl<AuthBloc>(),
        child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          final bloc = BlocProvider.of<AuthBloc>(context);
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: media.height * .03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Add Your Phone",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "poppins",
                          fontSize: 40),
                    ),
                    CustomText(
                      "Please Sureable it your number personality",
                      isBold: false,
                    ),
                    SizedBox(
                      height: media.height * .03,
                    ),
                    CustomTextField(
                        onChange: (value) {
                          bloc.add(ChangeColorButton(value));
                        },
                        borderColor: Colors.yellowAccent.shade400,
                        styleBorder: const OutlineInputBorder(),
                        labelText: "Phone Number",
                        hinText: "+20",
                        // controller: null,
                        controller: bloc.state.phoneController),
                    SizedBox(
                      height: media.height * .03,
                    ),
                    CustomButton(
                      width: media.width,
                      primary: bloc.state.phoneController.text == ""
                          ? Colors.transparent
                          : Colors.yellowAccent,
                      onPressed: () {
                        bloc.add(AddPhoneNumberEvent(
                            phoneNumber: bloc.state.phoneController.text,
                            context: context));
                      },
                      text: "Add",
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
