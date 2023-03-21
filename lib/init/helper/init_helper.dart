/*

© 2023 B1 Digital

User         : alisinancobani
Project Name : flutter_juul 
Name         : Ali Sinan COBANI
Date         : 18.03.2023 17:46
Notes        : 




*/

part of '../init.dart';

class InitHelper {
  final List<BlocProvider> _blocProviders = [
    BlocProvider<JuulBleBloc>(
      create: (BuildContext context) => JuulBleBloc(),
    ),
  ];

  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const HomeScreen(),
      ),
    ],
  );
}
