import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:gym_app/cubit/cubit.dart';
import 'package:gym_app/cubit/states.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GymCubit, GymStates>(
        builder: (context, state) {
          var cubit = GymCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.black,
            // body:SafeArea(child: ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.black, width: 1)),
                child: GNav(
                    selectedIndex: cubit.currentIndex,
                    onTabChange: (int i) {
                      cubit.change(i);
                    },
                    haptic: true,
                    tabs: const [
                      GButton(
                        icon: Icons.home,
                        text: "Home",
                      ),
                      GButton(
                        icon: Icons.face,
                        text: "Face",
                      ),
                    ]),
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
