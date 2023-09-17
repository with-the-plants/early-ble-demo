// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'index.dart'; // Imports other custom actions

// Imports other custom actions
import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import '/custom_code/bluetooth_default_uuids.dart';
import 'dart:developer' show log;

Future<void> connectDevice(
    String id, Future<dynamic> Function()? update) async {
  final state = FFAppState();

  final BluetoothDevice device = BluetoothDevice.fromId(id);
  await device.connect();

  final List<BluetoothService> services = await device.discoverServices();

  services.forEach((BluetoothService service) {
    log("connectDevice: service: $service");

    GattServiceStruct gss =
        GattServiceStruct(uuid: service.uuid.toString(), characteristics: []);

    log("gss: $gss");

    final BluetoothDefaultServiceUUID knownService;
    try {
      knownService = BluetoothDefaultServiceUUID.values
          .firstWhere((uuid) => (gss.uuid == uuid.uuid));
    } catch (e) {
      return;
    }

    log("connectDevice: knownService: $knownService");
    gss.name = knownService.name;

    switch (knownService) {
      case BluetoothDefaultServiceUUID.deviceInformation:
      case BluetoothDefaultServiceUUID.currentTime:
      case BluetoothDefaultServiceUUID.battery:
        final List<BluetoothCharacteristic> characteristics =
            service.characteristics;
        characteristics.forEach((c) {
          log("connectDevice: characteristic: $c");
          final BluetoothDefaultCharacteristicUUID knownCharacteristic;
          try {
            knownCharacteristic = BluetoothDefaultCharacteristicUUID.values
                .firstWhere((uuid) => (c.uuid.toString() == uuid.uuid));
          } catch (e) {
            return;
          }
          log("connectDevice: knownCharacteristic: $knownCharacteristic");
          gss.characteristics.add(GattCharacteristicStruct(
              name: knownCharacteristic.name, uuid: knownCharacteristic.uuid));
        });
        break;
      default:
        break;
    }

    log("gss2: $gss");

    state.addToCurrentServices(gss);
    update;
    return;
  });
}
