import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'copy_widget.dart' show CopyWidget;
import 'package:flutter/material.dart';

class CopyModel extends FlutterFlowModel<CopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PlacePicker widget.
  var placePickerValue = const FFPlace();
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
