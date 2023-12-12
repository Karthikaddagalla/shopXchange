import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'main_chat_widget.dart' show MainChatWidget;
import 'package:flutter/material.dart';

class MainChatModel extends FlutterFlowModel<MainChatWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
