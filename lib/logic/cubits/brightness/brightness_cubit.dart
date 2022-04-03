import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mindful/logic/repositories/shared_preferences_repository.dart';

class BrightnessCubit extends Cubit<ThemeMode> {
  final SharedPreferencesRepository sharedPreferencesRepository;

  BrightnessCubit(this.sharedPreferencesRepository)
      : super(sharedPreferencesRepository.getBrightness());

  void changeBrightness(ThemeMode brightness) {
    emit(brightness);
    sharedPreferencesRepository.setBrightness(brightness);
  }
}
