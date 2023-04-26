import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/components/components.dart';
import 'package:gym_app/cubit/cubit.dart';
import 'package:gym_app/cubit/states.dart';
import 'package:gym_app/modules/type/type.dart';
import 'package:gym_app/shared/network/network.dart';

class Choose extends StatelessWidget {
  const Choose({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GymCubit, GymStates>(
        builder: (context, state) {
          var cubit = GymCubit.get(context);
          return Scaffold(
            body: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 9 / 10,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) => card(
                      image: cubit.musclesType[index],
                      function: () {
                        navigator(
                            context: context,
                            widget: Type(
                                muscles: cubit.musclesType[index]
                                    .replaceAll("assets/", "")
                                    .replaceAll(".png", "")
                                    .replaceAll(".jpg", "")
                                    .replaceAll("_", " ")));
                      },
                      name: cubit.musclesType[index]
                          .replaceAll("assets/", "")
                          .replaceAll(".png", "")
                          .replaceAll(".jpg", "")
                          .replaceAll("_", " ")),
                  itemCount: cubit.musclesType.length,
                )),
          );
        },
        listener: (context, state) {});
  }
}
