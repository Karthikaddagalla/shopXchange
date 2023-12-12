import '/components/custom_navbar_component/custom_navbar_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
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
}
