part of 'juul_ble_bloc.dart';

enum JuulBleStatus {
  initial,
  scanning,
  connected,
  disconnected,
  error,
  idle,
}

enum JuulBleDeviceAddStatus { initial, added, idle }

class JuulBleState extends Equatable {
  const JuulBleState({
    this.deviceAddStatus = JuulBleDeviceAddStatus.initial,
    this.scanningStatus = JuulBleStatus.initial,
    this.devices,
    this.error,
  });

  final JuulBleDeviceAddStatus deviceAddStatus;
  final List<ScanResult>? devices;
  final JuulBleStatus scanningStatus;
  final String? error;

  @override
  List<Object?> get props => [scanningStatus, devices, deviceAddStatus];

  JuulBleState copyWith({
    JuulBleDeviceAddStatus? deviceAddStatus,
    List<ScanResult>? devices,
    JuulBleStatus? scanningStatus,
    String? error,
  }) {
    return JuulBleState(
      deviceAddStatus: deviceAddStatus ?? this.deviceAddStatus,
      devices: devices ?? this.devices,
      scanningStatus: scanningStatus ?? this.scanningStatus,
      error: error ?? this.error,
    );
  }

  @override
  String toString() {
    return 'JuulBleState{scanningStatus: $scanningStatus, deviceAddStatus: $deviceAddStatus, error: $error }';
  }
}
