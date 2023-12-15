import '/flutter_flow/flutter_flow_util.dart';
import 'update_existing_profile_details_widget.dart'
    show UpdateExistingProfileDetailsWidget;
import 'package:flutter/material.dart';

class UpdateExistingProfileDetailsModel
    extends FlutterFlowModel<UpdateExistingProfileDetailsWidget> {
  ///  Local state fields for this page.

  String? uploadedImage = '';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  String? _yourNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 3) {
      return 'Minimum 3 Characters Required';
    }
    if (val.length > 30) {
      return 'max 30 Characters Only';
    }

    return null;
  }

  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberController;
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  String? _phoneNumberControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 10) {
      return '10 Characters Required';
    }

    if (!RegExp('[5-9]{1}[0-9]{9}').hasMatch(val)) {
      return 'Enter Valid Number';
    }
    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    yourNameControllerValidator = _yourNameControllerValidator;
    phoneNumberControllerValidator = _phoneNumberControllerValidator;
  }

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
