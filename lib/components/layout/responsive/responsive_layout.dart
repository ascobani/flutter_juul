/*

© 2023 

User         : alisinancobani
Project Name : flutter_juul 
Name         : Ali Sinan COBANI
Date         : 18.03.2023 18:20
Notes        : 




*/

import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    Key? key,
    required this.phoneLayout,
    required this.tabletLayout,
  }) : super(key: key);

  final Widget phoneLayout;
  final Widget tabletLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return phoneLayout;
        } else {
          return tabletLayout;
        }
      },
    );
  }
}
