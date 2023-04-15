import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/_authenticator/presentation/auth_controller/auth_event.dart';
import 'package:news_app_clean_architecture/core/widgets/custom_button/custom_button.dart';
import 'package:news_app_clean_architecture/core/widgets/custom_text/text.dart';
import 'package:news_app_clean_architecture/presentation_screens/presentation/controller/intro_cubit.dart';

import '../../../core/global/globals.dart';
import '../../../core/services/services_locator.dart';
import '../../../core/widgets/custom_app_bar/app_bar.dart';
import '../../../core/widgets/custom_user_image/user_image.dart';
import '../auth_controller/auth_bloc.dart';
import '../auth_controller/auth_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return ListView(physics: const BouncingScrollPhysics(), children: [
      Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: media.width,
                height: media.height * .45,
              ),
              CustomAppBar(
                  colorBackground: Colors.yellow,
                  textColor: Colors.black,
                  title: 'My Account',
                  widgets: [
                    IconButton(
                        onPressed: () {
                          BlocProvider.of<IntroBloc>(context)
                              .changeLocalizationEvent();
                        },
                        icon: const Icon(
                          Icons.language,
                          color: Colors.black,
                        ))
                  ],
                  toolbarHeight: media.height * .2),

              Positioned(
                  top: media.height * .13,
                  left: media.width * .3,
                  right: media.width * .3,
                  child: const UserImage(
                    isAppBar: false,
                  )),
              // Positioned(
              //     top: media.height * .21,
              //     left: media.width >= 810
              //         ? media.width * .01
              //         : media.width * .18,
              //     right: media.width >= 810
              //         ? media.width * .14
              //         : media.width * .37,
              //     child: GestureDetector(
              //       onTap: () async {
              //         var image = await ImagePicker()
              //             .pickImage(source: ImageSource.gallery);

              //         if (image == null) return;

              //         if (!mounted) return;
              //         setState(() {
              //           _image = File(image.path);
              //         });
              //       },
              //       child: Container(
              //         alignment: Alignment.center,
              //         height: media.height * .03,
              //         decoration: BoxDecoration(
              //             shape: BoxShape.circle,
              //             color: Theme.of(context).primaryColor),
              //         child: ImageIcon(
              //           AssetImage("assets/icons/add.png"),
              //           color: Colors.white,
              //           size: 16,
              //         ),
              //       ),
              //     )),
            ],
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: media.width * .03),
        child: Column(
          children: [
            fieldData(media,
                title: "Name",
                data: sharedPreferences.getString("name").toString()),
            fieldData(media,
                title: "email",
                data: sharedPreferences.getString("email").toString()),
            fieldData(media,
                title: "phone",
                data: sharedPreferences.getString("phone").toString()),
            BlocProvider(
                create: (context) => sl<AuthBloc>(),
                child:
                    BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                  final bloc = BlocProvider.of<AuthBloc>(context);
                  return CustomButton(
                    onPressed: () {
                      bloc.add(LogOut(context));
                    },
                    text: "Logout",
                  );
                }))
          ],
        ),
      ),
    ]);
  }

  Padding fieldData(Size media, {required String title, required String data}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: media.width * .01, vertical: media.height * .005),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: media.width * .02, vertical: media.height * .01),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: CustomText(
                text: title,
              ),
            ),
            Expanded(
              flex: 5,
              child: CustomText(
                text: data,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
