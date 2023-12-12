import '/flutter_flow/flutter_flow_util.dart';
import 'auth3_forgot_password_widget.dart' show Auth3ForgotPasswordWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Auth3ForgotPasswordModel
    extends FlutterFlowModel<Auth3ForgotPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  final emailMask = MaskTextInputFormatter(mask: '(###) ###-####');
  String? Function(BuildContext, String?)? emailControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    emailFocusNode?.dispose();
    emailController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
