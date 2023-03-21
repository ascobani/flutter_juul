import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

part 'juul_ble_event.dart';

part 'juul_ble_state.dart';

part '../service/juul_ble_service.dart';

part '../model/juul_ble_device_model.dart';

class JuulBleBloc extends Bloc<JuulBleEvent, JuulBleState> with JuulBleService {
  JuulBleBloc() : super(const JuulBleState()) {
    on<JuulBleAddDeviceEvent>(_onJuulBleAddDeviceEvent);
    on<JuulBleConnectEvent>(_onJuulBleConnectEvent);
    on<JuulBleScanEvent>(_onJuulBleScanEvent);
  }

  FutureOr<void> _onJuulBleScanEvent(
      JuulBleScanEvent event, Emitter<JuulBleState> emit) async {
    FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
    emit(
      state.copyWith(
        scanningStatus: JuulBleStatus.scanning,
      ),
    );
    await searchForDevices(
      flutterBlue: flutterBlue,
      data: (ScanResult result) {
        add(
          JuulBleAddDeviceEvent(
            result,
          ),
        );
      },
    );
    emit(
      state.copyWith(
        devices: [],
        scanningStatus: JuulBleStatus.idle,
      ),
    );
  }

  FutureOr<void> _onJuulBleAddDeviceEvent(
      JuulBleAddDeviceEvent event, Emitter<JuulBleState> emit) {
    emit(
      state.copyWith(
        deviceAddStatus: JuulBleDeviceAddStatus.added,
      ),
    );
    state.devices?.add(event.device);
    emit(
      state.copyWith(
        deviceAddStatus: JuulBleDeviceAddStatus.idle,
      ),
    );
  }

  FutureOr<void> _onJuulBleConnectEvent(
      JuulBleConnectEvent event, Emitter<JuulBleState> emit) async {
    await connectToDevice(
      device: event.device,
    ).catchError(
      (error) {
        emit(
          state.copyWith(
            error: error.toString(),
            scanningStatus: JuulBleStatus.error,
          ),
        );
      },
    );
  }
}
