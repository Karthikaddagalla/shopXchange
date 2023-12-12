import '/components/custom_navbar_component/custom_navbar_component_widget.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'all_users_widget.dart' show AllUsersWidget;
import 'package:flutter/material.dart';

class AllUsersModel extends FlutterFlowModel<AllUsersWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
    customNavbarComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
