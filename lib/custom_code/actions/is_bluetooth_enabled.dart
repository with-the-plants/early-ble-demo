// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:developer';

Future<bool> isBluetoothEnabled() async {
  final available = await FlutterBluePlus.isAvailable;
  log("isBluetoothEnabled.available: $available");
  if (!available) {
    return false;
  }
  if (Platform.isAndroid) {
    FlutterBluePlus.turnOn;
    await Future.delayed(Duration(milliseconds: 100));
  }
  final stateStream = await FlutterBluePlus.adapterState;
  // ARGH: This is an ugly hack, but works for now
  final state = await stateStream.first;
  log("isBluetoothEnabled.adapterState: $state");
  return state == BluetoothAdapterState.on;
}
