import '/flutter_flow/flutter_flow_util.dart';
import 'product_page_widget.dart' show ProductPageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductPageModel extends FlutterFlowModel<ProductPageWidget> {
  ///  Local state fields for this page.

  bool isSavedLocal = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 0;

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
