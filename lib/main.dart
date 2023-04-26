import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/cubit/cubit.dart';
import 'package:gym_app/modules/splash.dart';
import 'package:gym_app/shared/network/network.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GymCubit(),
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.black),
        debugShowCheckedModeBanner: false,
        home: const Splash(),
      ),
    );
  }
}
