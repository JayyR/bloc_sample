import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

enum AppTab { HOME, SHELF, SETTINGS }

class TabBloc extends Bloc<TabEvent, AppTab> {
    @override
  AppTab get initialState => AppTab.HOME;

  @override
  Stream<AppTab> mapEventToState(
    TabEvent event,
  ) async* {
    if(event is UpdateTab){
      yield event.tab;
    }
  }
}
