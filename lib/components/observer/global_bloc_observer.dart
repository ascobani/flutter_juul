/*

© 2023 B1 Digital

User         : alisinancobani
Project Name : flutter_juul 
Name         : Ali Sinan COBANI
Date         : 18.03.2023 19:51
Notes        : 




*/

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class GlobalBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint('"Event: $event');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint('"Transition: $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    debugPrint('"Error: $error');
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    debugPrint('"Create: $bloc');
  }
}
