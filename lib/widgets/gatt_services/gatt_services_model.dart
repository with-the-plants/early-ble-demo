import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/widgets/gatt_service/gatt_service_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GattServicesModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  List<GattServiceStruct> services = [];
  void addToServices(GattServiceStruct item) => services.add(item);
  void removeFromServices(GattServiceStruct item) => services.remove(item);
  void removeAtIndexFromServices(int index) => services.removeAt(index);
  void updateServicesAtIndex(int index, Function(GattServiceStruct) updateFn) =>
      services[index] = updateFn(services[index]);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
