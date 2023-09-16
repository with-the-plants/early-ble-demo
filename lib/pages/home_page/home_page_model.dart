import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/stranght_indicator/stranght_indicator_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<BTDeviceStruct> foundDevices = [];
  void addToFoundDevices(BTDeviceStruct item) => foundDevices.add(item);
  void removeFromFoundDevices(BTDeviceStruct item) => foundDevices.remove(item);
  void removeAtIndexFromFoundDevices(int index) => foundDevices.removeAt(index);
  void updateFoundDevicesAtIndex(
          int index, Function(BTDeviceStruct) updateFn) =>
      foundDevices[index] = updateFn(foundDevices[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - findDevices] action in HomePage widget.
  List<BTDeviceStruct>? foundDevices;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Model for StranghtIndicator component.
  late StranghtIndicatorModel stranghtIndicatorModel1;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    stranghtIndicatorModel1 =
        createModel(context, () => StranghtIndicatorModel());
  }

  void dispose() {
    unfocusNode.dispose();
    stranghtIndicatorModel1.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
