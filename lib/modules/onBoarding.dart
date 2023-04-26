import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/components/components.dart';
import 'package:gym_app/cubit/cubit.dart';
import 'package:gym_app/cubit/states.dart';
import 'package:gym_app/layout/layout.dart';
import 'package:gym_app/modules/choose/choose.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatelessWidget {
  PageController pageController = PageController();
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GymCubit, GymStates>(
        builder: (context, state) {
          var cubit = GymCubit.get(context);
          return Scaffold(
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsetsDirectional.only(
                  bottom: 12, start: 8, end: 8, top: 8),
              child: Column(
                children: [
                  Expanded(
                      child: PageView(
                    onPageChanged: (int i) {
                      cubit.change(i);
                      if (i == 1) {
                        check = true;
                      }
                    },
                    controller: pageController,
                    children: [
                      Stack(
                        children: [
                          Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(15)),
                              width: double.infinity,
                              height: double.infinity,
                              child: Image.asset(
                                "assets/onboard.png",
                                fit: BoxFit.cover,
                              )),
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(15)),
                              width: double.infinity,
                              height: double.infinity,
                              child: Image.asset(
                                "assets/onboard1.png",
                                fit: BoxFit.fill,
                              )),
                          Container(
                            color: Colors.black.withOpacity(0.4),
                            width: double.infinity,
                            height: double.infinity,
                          )
                        ],
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SmoothPageIndicator(
                          controller: pageController,
                          count: 2,
                          effect: const ExpandingDotsEffect(
                              dotColor: Colors.grey,
                              activeDotColor: Colors.white,
                              dotHeight: 10,
                              dotWidth: 10,
                              spacing: 8,
                              expansionFactor: 3.2)),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: material(
                            text: "Next",
                            font: 20,
                            color: Colors.black,
                            function: () {
                              pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                              if (check) {
                                navigatorAndPushReplacement(
                                    context: context, widget: Choose());
                              }
                            }),
                      )
                    ],
                  )
                ],
              ),
            )),
          );
        },
        listener: (context, state) {});
  }
}
