import 'package:equatable/equatable.dart';

abstract class StartupEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AppStarted extends StartupEvent{
  @override
  String toString() => 'AppStarted';
}

class OnBoarded extends StartupEvent{
  @override
  String toString() => 'OnBoarded';
}

class NotOnBoarded extends StartupEvent{
  @override
  String toString() => 'NotOnBoarded';
}
