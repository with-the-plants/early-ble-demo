import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/gatt_services/gatt_services_widget.dart';
import '/widgets/stranght_indicator/stranght_indicator_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DevicePageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<GattServiceStruct> services = [];
  void addToServices(GattServiceStruct item) => services.add(item);
  void removeFromServices(GattServiceStruct item) => services.remove(item);
  void removeAtIndexFromServices(int index) => services.removeAt(index);
  void updateServicesAtIndex(int index, Function(GattServiceStruct) updateFn) =>
      services[index] = updateFn(services[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - connectDevice] action in DevicePage widget.
  List<GattServiceStruct>? services;
  // Model for StranghtIndicator component.
  late StranghtIndicatorModel stranghtIndicatorModel;
  // Model for GattServices component.
  late GattServicesModel gattServicesModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    stranghtIndicatorModel =
        createModel(context, () => StranghtIndicatorModel());
    gattServicesModel = createModel(context, () => GattServicesModel());
  }

  void dispose() {
    unfocusNode.dispose();
    stranghtIndicatorModel.dispose();
    gattServicesModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
