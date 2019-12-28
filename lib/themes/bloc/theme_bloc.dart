import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import './bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState =>
      ThemeState(themeData: ThemeData());

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ThemeChanged) {
      yield ThemeState(themeData: ThemeData());
    }
  }
}
