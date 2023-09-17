import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/gatt_service/gatt_service_widget.dart';
import '/widgets/stranght_indicator/stranght_indicator_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DevicePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - connectDevice] action in DevicePage widget.
  List<GattServiceStruct>? services;
  // Model for StranghtIndicator component.
  late StranghtIndicatorModel stranghtIndicatorModel;
  // Model for GattService component.
  late GattServiceModel gattServiceModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    stranghtIndicatorModel =
        createModel(context, () => StranghtIndicatorModel());
    gattServiceModel = createModel(context, () => GattServiceModel());
  }

  void dispose() {
    unfocusNode.dispose();
    stranghtIndicatorModel.dispose();
    gattServiceModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
