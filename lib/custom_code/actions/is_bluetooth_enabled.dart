// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions

import 'dart:io';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:developer';

Future<bool> isBluetoothEnabled() async {
  FlutterBluePlus.setLogLevel(LogLevel.verbose, color: false);
  final available = await FlutterBluePlus.isAvailable;
  log("isBluetoothEnabled.available: $available");
  if (!available) {
    return false;
  }
  if (Platform.isAndroid || Platform.isMacOS) {
    log("isBluetoothEnabled: turning on");
    FlutterBluePlus.turnOn;
    await Future.delayed(Duration(milliseconds: 1000));
  }
  final stateStream = await FlutterBluePlus.adapterState;
  // TBD. I don't like using Completer, but that is the best I have now.
  Completer<bool> completer = new Completer<bool>();
  // TBD. This stream should be handled more centrally, not here.
  // 2023-09-16 13:03:08.102 early_ble_demo[20595:3455267] [FBP-iOS] centralManagerDidUpdateState CBManagerStatePoweredOff
  // 2023-09-16 13:03:08.102 early_ble_demo[20595:3455267] [FBP-iOS] disconnectAllDevices
  // 2023-09-16 14:12:34.733 early_ble_demo[20595:3455267] [FBP-iOS] centralManagerDidUpdateState CBManagerStatePoweredOn
  // [ERROR:flutter/runtime/dart_vm_initializer.cc(41)] Unhandled Exception: Bad state: Future already completed
  // #0      _AsyncCompleter.complete (dart:async/future_impl.dart:41:31)
  // #1      isBluetoothEnabled.<anonymous closure> (package:mot_p_first_bluetooth_demo/custom_code/actions/is_bluetooth_enabled.dart:43:19)
  // #2      Stream.forEach.<anonymous closure>.<anonymous closure> (dart:async/stream.dart:1193:38)

  stateStream.forEach((state) async {
    log("isBluetoothEnabled: $state");
    switch (state) {
      case BluetoothAdapterState.unavailable:
        completer.complete(false);
        // The user need to be instructed to turn on BlueTooth permissions.
        log("isBluetoothEnabled: adapter state unavailable, check entitlements and permissions. TBD.");
        return;
      case BluetoothAdapterState.on:
        completer.complete(true);
        log("isBluetoothEnabled: adapter state on: returning true");
        return;
      default:
        // When does this happen?
        log("isBluetoothEnabled: BlueTooth adapter state unknown: $state.  Continuing.");
    }
  });
  Future<bool> result = completer.future;
  log("isBluetoothEnabled: returning $result");
  return result;
}
