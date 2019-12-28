import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class StartupBloc extends Bloc<StartupEvent, StartupState> {
  
  @override
  StartupState get initialState => InitialStartupState();

  @override
  Stream<StartupState> mapEventToState(
    StartupEvent event,
  ) async* {
    if(event is AppStarted){
      try{
        //String isOnBoardValue = await LocalStorage.sharedInstance.readValue(Constants.isOnBoard);
        //bool isFirstTime = isOnBoardValue == null || isOnBoardValue == "0";
        bool isFirstTime = true;
        if (isFirstTime) {
          yield NotOnBoardedState();
        }else{
          yield OnBoardedState(isFirstTime: isFirstTime);
        }
      }catch(_){
          yield OnBoardedState(isFirstTime:false);
      }
    }
  }
}
