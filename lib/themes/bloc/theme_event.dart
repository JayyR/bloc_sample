
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';


enum AppTheme {
  GreenLight,
  GreenDark,
  BlueLight,
  BlueDark,
}
abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
  @override
  List<Object> get props => [];
}

class ThemeChanged extends ThemeEvent {
  final AppTheme theme;

  ThemeChanged({@required this.theme});

  @override
  List<Object> get props => [theme];

  @override
  String toString() => 'ThemeChanged';
}
