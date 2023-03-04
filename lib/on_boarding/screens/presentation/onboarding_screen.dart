// ignore_for_file: unnecessary_null_comparison


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app_clean_architecture/core/core_components/custom_text/text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/core_components/general_button/general_button.dart';
import '../../../core/services/services_locator.dart';
import '../component/custom_text_on Boarding/text.dart';
import '../controller/on_boarding_bloc.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) {
        return sl<OnBoardingBloc>();
      },
      child: BlocBuilder<OnBoardingBloc, OnBoardingState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: media.width * .05, vertical: media.width * .1),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: media.width * .02),
                    padding: EdgeInsets.symmetric(
                        horizontal: media.width * .03,
                        vertical: media.height * .009),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.sp),
                          topRight: Radius.circular(15.sp)),
                      color: Colors.grey.shade200,
                    ),
                    child: SmoothPageIndicator(
                      controller: state.controller,
                      count: state.modelOnBoarding.length,
                      effect: ScrollingDotsEffect(
                          spacing: 8.0.sp,
                          dotWidth: 20.0.w,
                          dotColor: Colors.indigo.shade100,
                          activeDotColor: Colors.indigo),
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.modelOnBoarding.length,
                      controller: state.controller,
                      onPageChanged: (value) => state.turn = value,
                      itemBuilder: (context, index) {
                        final bloc = BlocProvider.of<OnBoardingBloc>(context);
                        return Container(
                          width: media.width,
                          height: media.height,
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                              horizontal: media.width * .02),
                          padding: EdgeInsets.symmetric(
                              horizontal: media.width * .03,
                              vertical: media.height * .02),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                  height: media.height * .5,
                                  child: state.modelOnBoarding[index].image1 ==
                                          null
                                      ? Lottie.asset(
                                          state.modelOnBoarding[index].image
                                              .toString(),
                                        )
                                      : Image.asset(
                                          state.modelOnBoarding[index].image1
                                              .toString(),
                                          width: media.width * .4,
                                        )),
                              CustomTextOnBoarding(
                                  state.modelOnBoarding[index].title),
                              SizedBox(
                                height: media.height * .03,
                              ),
                              CustomText(state.modelOnBoarding[index].subTitle),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  AnimatedCrossFade(
                                      firstChild: IconButton(
                                          onPressed: () {
                                            bloc.add(SwitchPageViewEvent(
                                              context: context ,
                                                state.turn));
                                          },
                                          icon: Icon(
                                            Icons.navigate_next_sharp,
                                            size: 40.sp,
                                          )),
                                      secondChild: GeneralButton(
                                        onPressed: () => bloc.add(NavigatorToLoginScreen(context: context)),
                                        child: CustomText("Start"),
                                      ),
                                      crossFadeState:
                                          state.transferWidget == true
                                              ? CrossFadeState.showFirst
                                              : CrossFadeState.showSecond,
                                      duration:
                                          const Duration(microseconds: 800))
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
