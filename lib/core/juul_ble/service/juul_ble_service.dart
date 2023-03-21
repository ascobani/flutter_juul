/*

© 2023 B1 Digital

User         : alisinancobani
Project Name : flutter_juul 
Name         : Ali Sinan COBANI
Date         : 18.03.2023 18:53
Notes        : 




*/

part of '../bloc/juul_ble_bloc.dart';

class JuulBleService {
  Future<void> searchForDevices(
      {required FlutterBluePlus flutterBlue,
      required Function(ScanResult) data}) async {
    await flutterBlue.startScan(timeout: const Duration(seconds: 4));
    flutterBlue.scanResults.listen(
      (List<ScanResult> results) {
        for (ScanResult result in results) {
          data(result);
        }
      },
      onDone: () => flutterBlue.stopScan(),
      onError: (Object error) => throw Exception(error),
    );
  }
}

Future<void> connectToDevice({required BluetoothDevice device}) async {
  await device.connect(
    autoConnect: false,
    timeout: const Duration(seconds: 4),
  );
  getDataFromDevice(device: device);
}

Future<void> disconnectFromDevice({required BluetoothDevice device}) async {
  await device.disconnect();
}

Future<void> getDataFromDevice({required BluetoothDevice device}) async {
  final List<BluetoothService> services = await device.discoverServices();
  for (BluetoothService service in services) {
    final List<BluetoothCharacteristic> characteristics =
        service.characteristics;
    for (BluetoothCharacteristic characteristic in characteristics) {
      final List<int> value = await characteristic.read();
      print(value);
    }
  }
}