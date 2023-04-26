import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/cubit/states.dart';
import 'package:gym_app/models/muscles_model.dart';
import 'package:gym_app/shared/endpoints.dart';
import 'package:gym_app/shared/network/network.dart';

class GymCubit extends Cubit<GymStates> {
  GymCubit() : super(GymIntialState());
  static GymCubit get(context) => BlocProvider.of(context);
  List<String> musclesType = [
    "assets/pectoralis_major.png",
    "assets/biceps.jpg",
    "assets/abdominals.jpg",
    "assets/sartorius.jpg",
    "assets/abductors.jpg",
    "assets/trapezius.jpg",
    "assets/deltoid.jpg",
    "assets/serratus_anterior.png",
    "assets/external_oblique.jpg",
    "assets/brachioradialis.jpg",
    "assets/finger_extensors.jpg",
    "assets/finger_flexors.png",
    "assets/quadriceps.jpg",
    "assets/hamstrings.jpg",
    "assets/gastrocnemius.jpg",
    "assets/infraspinatus.png",
    "assets/latissimus_dorsi.jpg",
    "assets/triceps.jpg",
    "assets/gluteus_medius.jpg",
    "assets/gluteus_maximus.png"
  ];
  int currentIndex = 0;
  void change(int i) {
    currentIndex = i;
    emit(GymChangeState());
  }

  int current = 0;
  void onBoard(int i) {
    current = i;
    emit(GymChangePageState());
  }

  // MusclesModel? musclesModel;
  List<dynamic> result = [];

  void getMucsles({required String params, required String key}) {
    DioHelper.getData(path: "search/", key: key, params: params).then((value) {
      result = value.data;
      emit(GymMusclesSuccessState());
    }).catchError((e) {
      log(e.toString());
      emit(GymMusclesErrorState());
    });
  }
}
