import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<BTDeviceStruct> _foundDevices = [];
  List<BTDeviceStruct> get foundDevices => _foundDevices;
  set foundDevices(List<BTDeviceStruct> _value) {
    _foundDevices = _value;
  }

  void addToFoundDevices(BTDeviceStruct _value) {
    _foundDevices.add(_value);
  }

  void removeFromFoundDevices(BTDeviceStruct _value) {
    _foundDevices.remove(_value);
  }

  void removeAtIndexFromFoundDevices(int _index) {
    _foundDevices.removeAt(_index);
  }

  void updateFoundDevicesAtIndex(
    int _index,
    BTDeviceStruct Function(BTDeviceStruct) updateFn,
  ) {
    _foundDevices[_index] = updateFn(_foundDevices[_index]);
  }

  void insertAtIndexInFoundDevices(int _index, BTDeviceStruct _value) {
    _foundDevices.insert(_index, _value);
  }

  List<GattServiceStruct> _currentServices = [];
  List<GattServiceStruct> get currentServices => _currentServices;
  set currentServices(List<GattServiceStruct> _value) {
    _currentServices = _value;
  }

  void addToCurrentServices(GattServiceStruct _value) {
    _currentServices.add(_value);
  }

  void removeFromCurrentServices(GattServiceStruct _value) {
    _currentServices.remove(_value);
  }

  void removeAtIndexFromCurrentServices(int _index) {
    _currentServices.removeAt(_index);
  }

  void updateCurrentServicesAtIndex(
    int _index,
    GattServiceStruct Function(GattServiceStruct) updateFn,
  ) {
    _currentServices[_index] = updateFn(_currentServices[_index]);
  }

  void insertAtIndexInCurrentServices(int _index, GattServiceStruct _value) {
    _currentServices.insert(_index, _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
