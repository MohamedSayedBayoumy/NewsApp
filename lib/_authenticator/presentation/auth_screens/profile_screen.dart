import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/_authenticator/presentation/auth_controller/auth_event.dart';
import 'package:news_app_clean_architecture/core/widgets/custom_button/custom_button.dart';
import 'package:news_app_clean_architecture/core/widgets/custom_text/text.dart';

import '../../../core/global/globals.dart';
import '../../../core/services/services_locator.dart';
import '../auth_controller/auth_bloc.dart';
import '../auth_controller/auth_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<AuthBloc>(),
        child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          final bloc = BlocProvider.of<AuthBloc>(context);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: "${sharedPreferences.getString("name")}",
              ),
              CustomText(
                text: "${sharedPreferences.getString("email")}",
              ),
              CustomText(
                text: "${sharedPreferences.getString("token")}",
              ),
              CustomText(
                text: "${sharedPreferences.getString("image")}",
              ),
              const SizedBox(
                height: 15,
              ),
              CustomText(
                text: "${sharedPreferences.getString("id")}",
              ),
              CustomText(
                text: "${sharedPreferences.getString("phone")}",
              ),
              CustomButton(onPressed: () {
                bloc.add(LogOut(context)) ;
              } , text: "Logout",)
            ],
          );
        }));
  }
}
