/*

© 2023 B1 Digital

User         : alisinancobani
Project Name : flutter_juul 
Name         : Ali Sinan COBANI
Date         : 18.03.2023 17:39
Notes        : 




*/

import 'package:flutter/material.dart';

// Import
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:go_router/go_router.dart';

// Bloc
import '../core/juul_ble/bloc/juul_ble_bloc.dart';

// View
import '../view/home/home_screen.dart';

// Export
export 'package:flutter/material.dart';
export 'package:bloc/bloc.dart';
export '../components/observer/global_bloc_observer.dart';
export 'package:flutter_blue_plus/flutter_blue_plus.dart';
export 'package:flutter_native_splash/flutter_native_splash.dart';

// Part
part 'helper/init_helper.dart';

class Init extends StatelessWidget with InitHelper {
  Init({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _blocProviders,
      child: MaterialApp.router(
        title: 'Juul App',
        themeMode: ThemeMode.system,
        theme: FlexThemeData.light(scheme: FlexScheme.mandyRed),
        darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
        routerConfig: _router,
      ),
    );
  }
}
