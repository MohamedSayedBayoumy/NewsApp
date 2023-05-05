import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/services_locator.dart';
import '../../../core/widgets/custom_button/custom_button.dart';
import '../../../core/widgets/custom_text/text.dart';
import '../../../core/widgets/custom_textfiled/text_filed.dart';
import '../auth_controller/auth_bloc.dart';
import '../auth_controller/auth_event.dart';
import '../auth_controller/auth_state.dart';

class AddPhoneScreen extends StatelessWidget {
  const AddPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
        body: BlocProvider<AuthBloc>(
            create: (context) => sl<AuthBloc>(),
            child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
              final bloc = BlocProvider.of<AuthBloc>(context);
              return SafeArea(
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
                        text: "Please Sureable it your number personality",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(
                        height: media.height * .03,
                      ),
                      CustomTextField(
                          onChange: (value) {
                            bloc.add(ChangeColorButton(value));
                            return null;
                          },
                          borderColor: Colors.yellowAccent.shade400,
                          styleBorder: const OutlineInputBorder(),
                          labelText: "Phone Number",
                          hinText: "+20",
                          controller: bloc.state.phoneController),
                      SizedBox(
                        height: media.height * .03,
                      ),
                      customButton(
                        context: context,
                        width: media.width,
                        backgroundColor: bloc.state.phoneController.text == ""
                            ? Colors.transparent
                            : Colors.amber,
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
              );
            })));
  }
}
