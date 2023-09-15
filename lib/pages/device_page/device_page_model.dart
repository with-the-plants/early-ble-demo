import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/display_received_data/display_received_data_widget.dart';
import '/widgets/stranght_indicator/stranght_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DevicePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for StranghtIndicator component.
  late StranghtIndicatorModel stranghtIndicatorModel;
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for DisplayReceivedData component.
  late DisplayReceivedDataModel displayReceivedDataModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    stranghtIndicatorModel =
        createModel(context, () => StranghtIndicatorModel());
    displayReceivedDataModel =
        createModel(context, () => DisplayReceivedDataModel());
  }

  void dispose() {
    unfocusNode.dispose();
    stranghtIndicatorModel.dispose();
    textController?.dispose();
    displayReceivedDataModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
