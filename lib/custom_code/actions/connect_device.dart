// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

// Imports other custom actions
import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import '/custom_code/bluetooth_default_uuids.dart';
import 'dart:developer' show log;

Future<List<GattServiceStruct>> connectDevice(
    String id, Future<dynamic> Function()? update) async {
  final state = FFAppState();

  final BluetoothDevice device = BluetoothDevice.fromId(id);
  await device.connect();

  final List<BluetoothService> services = await device.discoverServices();
  final List<GattServiceStruct> gattServices =
      services.map((BluetoothService service) {
    log("connectDevice: service: $service");

    GattServiceStruct gss = GattServiceStruct(uuid: service.uuid.toString());

    log("gss: $gss");

    final BluetoothDefaultServiceUUID knownService;
    try {
      knownService = BluetoothDefaultServiceUUID.values
          .firstWhere((uuid) => (gss.uuid == uuid.uuid));
    } catch (e) {
      return gss;
    }

    log("connectDevice: knownService: $knownService");
    gss.name = knownService.name;

    switch (knownService) {
      case BluetoothDefaultServiceUUID.deviceInformation:
        final List<BluetoothCharacteristic> characteristics =
            service.characteristics;
        characteristics.forEach((c) {
          log("connectDevice: characteristic: $c");
          final BluetoothDefaultCharacteristicUUID knownCharacteristic =
              BluetoothDefaultCharacteristicUUID.values
                  .firstWhere((uuid) => (c.uuid.toString() == uuid.uuid));
          log("connectDevice: knownCharacteristic: $knownCharacteristic");
        });
        break;
      default:
        break;
    }

    log("gss2: $gss");

    return gss;
  }).toList();
  update;
  return gattServices;
}
