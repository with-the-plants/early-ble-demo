// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Imports other custom actions
import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
// import '/custom_code/bluetooth_default_uuids.dart'
import 'dart:developer' show log;

Future<void> connectDevice(String id) async {
  final BluetoothDevice device = BluetoothDevice.fromId(id);
  await device.connect();
  final List<BluetoothService> services = await device.discoverServices();
  services.forEach((BluetoothService service) {
    log("connectDevice: service: $service");

    // BluetoothDefaultServiceUUID knownService =
    //  BluetoothDefaultServiceUUID.values.firstWhere((uuid)
    //    => (service.serviceUuid.toString() == uuid.uuid));
    // log("connectDevice: knownService: $knownService");
  });
}
