import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/components/components.dart';
import 'package:gym_app/cubit/cubit.dart';
import 'package:gym_app/cubit/states.dart';
import 'package:gym_app/modules/youtube/youtube.dart';

class Type extends StatelessWidget {
  String muscles;
  Type({required this.muscles});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GymCubit, GymStates>(
      builder: (context, state) {
        var cubit = GymCubit.get(context);
        return Scaffold(
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: card(
                          context: context,
                          check: true,
                          con: true,
                          image: "assets/one.jpg",
                          function: () {
                            navigator(
                                context: context, widget: const Youtube());
                            cubit.getMucsles(
                                params: muscles, key: "primaryMuscle");
                          },
                          name: "Primary Muscle")),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: card(
                          context: context,
                          check: true,
                          con: true,
                          image: "assets/two.jpg",
                          function: () {
                            navigator(
                                context: context, widget: const Youtube());
                            cubit.getMucsles(
                                params: muscles, key: "secondaryMuscle");
                          },
                          name: "Secondary Muscle"))
                ],
              ),
            ),
          )),
        );
      },
      listener: (context, state) {},
    );
  }
}
