import '/flutter_flow/flutter_flow_util.dart';
import 'phone_number_profile_widget.dart' show PhoneNumberProfileWidget;
import 'package:flutter/material.dart';

class PhoneNumberProfileModel
    extends FlutterFlowModel<PhoneNumberProfileWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
