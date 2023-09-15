import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/widgets/stranght_indicator/stranght_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Switch widget.
  bool? switchValue;
  // Model for StranghtIndicator component.
  late StranghtIndicatorModel stranghtIndicatorModel1;
  // Model for StranghtIndicator component.
  late StranghtIndicatorModel stranghtIndicatorModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    stranghtIndicatorModel1 =
        createModel(context, () => StranghtIndicatorModel());
    stranghtIndicatorModel2 =
        createModel(context, () => StranghtIndicatorModel());
  }

  void dispose() {
    unfocusNode.dispose();
    stranghtIndicatorModel1.dispose();
    stranghtIndicatorModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
