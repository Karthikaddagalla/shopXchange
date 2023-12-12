import '/components/custom_navbar_component/custom_navbar_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'home_page_column_widget.dart' show HomePageColumnWidget;
import 'package:flutter/material.dart';

class HomePageColumnModel extends FlutterFlowModel<HomePageColumnWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool firestoreRequestCompleted = false;
  String? firestoreRequestLastUniqueKey;
  // Model for Custom_Navbar_Component component.
  late CustomNavbarComponentModel customNavbarComponentModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    customNavbarComponentModel =
        createModel(context, () => CustomNavbarComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    customNavbarComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForFirestoreRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
