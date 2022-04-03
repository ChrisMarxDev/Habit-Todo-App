import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindful/logic/repositories/shared_preferences_repository.dart';

part 'color_palette.dart';

class ColorPaletteCubit extends Cubit<ColorPalette> {
  final SharedPreferencesRepository sharedPreferencesRepository;

  ColorPaletteCubit({required this.sharedPreferencesRepository})
      : super(sharedPreferencesRepository.getActivePalette() ?? basePalette);

  void changePalette(ColorPalette palette) {
    sharedPreferencesRepository.setActivePalette(palette);
    emit(palette);
  }
}
