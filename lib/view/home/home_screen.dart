/*

© 2023 

User         : alisinancobani
Project Name : flutter_juul 
Name         : Ali Sinan COBANI
Date         : 18.03.2023 18:20
Notes        : 




*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_juul/components/layout/responsive/responsive_layout.dart';
import 'package:flutter_juul/core/juul_ble/bloc/juul_ble_bloc.dart';

part 'mobile/phone/home_screen_phone.dart';

part 'mobile/tablet/home_screen_tablet.dart';

part 'helper/home_screen_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      phoneLayout: HomeScreenPhone(),
      tabletLayout: HomeScreenTablet(),
    );
  }
}
