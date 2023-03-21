part of 'juul_ble_bloc.dart';

abstract class JuulBleEvent extends Equatable {
  const JuulBleEvent();
}

class JuulBleScanEvent extends JuulBleEvent {
  const JuulBleScanEvent();
  @override
  List<Object?> get props => [];
}

class JuulBleAddDeviceEvent extends JuulBleEvent {
  const JuulBleAddDeviceEvent(this.device);
  final ScanResult device;
  @override
  List<Object?> get props => [device];
}
class JuulBleConnectEvent extends JuulBleEvent {
  const JuulBleConnectEvent(this.device);
  final BluetoothDevice device;
  @override
  List<Object?> get props => [device];
}
