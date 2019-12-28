import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'authentication/bloc/bloc.dart';
import 'simple_bloc_delegate.dart';
import 'startup/bloc/bloc.dart';
import 'tab_bar/bloc/bloc.dart';
import 'themes/bloc/bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      //Global Providers
      providers: [
        BlocProvider<StartupBloc>(
            create: (context) => StartupBloc()..add(AppStarted())),
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
            userRepository: UserRepository(),
          )..add(CheckLoggedIn()),
        ),
        BlocProvider<TabBloc>(
          create: (context) => TabBloc()..add(UpdateTab(AppTab.HOME)),
        ),
        BlocProvider<ThemeBloc>(create: (context) => ThemeBloc())
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            color: Colors.green,
            debugShowCheckedModeBanner: false,
            theme: state.themeData,
            //localizationsDelegates: [AppLocalizationsDelegate()],
            home: StartupScreen(),
          );
        },
      ),
    );
  }
}

class StartupScreen extends StatelessWidget {
  const StartupScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: BlocBuilder<StartupBloc, StartupState>(
        builder: (context, state) {
          return Container(
              child: Column(
            children: <Widget>[
              Text(state.toString()),
            ],
          ));
        },
      ),
    );
  }
}
