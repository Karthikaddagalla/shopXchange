import '/backend/backend.dart';
import '/components/custom_navbar_component/custom_navbar_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'my_ads_widget.dart' show MyAdsWidget;
import 'package:flutter/material.dart';

class MyAdsModel extends FlutterFlowModel<MyAdsWidget> {
  ///  Local state fields for this page.

  List<ShopsRecord> savedDocs = [];
  void addToSavedDocs(ShopsRecord item) => savedDocs.add(item);
  void removeFromSavedDocs(ShopsRecord item) => savedDocs.remove(item);
  void removeAtIndexFromSavedDocs(int index) => savedDocs.removeAt(index);
  void insertAtIndexInSavedDocs(int index, ShopsRecord item) =>
      savedDocs.insert(index, item);
  void updateSavedDocsAtIndex(int index, Function(ShopsRecord) updateFn) =>
      savedDocs[index] = updateFn(savedDocs[index]);

  int? iVariable = 0;

  int? iMax;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

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
    tabBarController?.dispose();
    customNavbarComponentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
