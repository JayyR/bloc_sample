import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class StartupState extends Equatable {
  const StartupState();
  @override
  List<Object> get props => [];
}

class InitialStartupState extends StartupState {
  @override
  String toString() => 'Uninitialized';
}

class OnBoardedState extends StartupState {
  final bool isFirstTime;

  OnBoardedState({@required this.isFirstTime});

  @override
  List<Object> get props => [isFirstTime];
  @override
  String toString() => 'OnBoardedState';
}

class NotOnBoardedState extends StartupState {
  @override
  String toString() => 'NotOnBoardedState';
}
