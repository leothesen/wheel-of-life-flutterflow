import '/flutter_flow/flutter_flow_util.dart';
import 'place_picker_test_widget.dart' show PlacePickerTestWidget;
import 'package:flutter/material.dart';

class PlacePickerTestModel extends FlutterFlowModel<PlacePickerTestWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = const FFPlace();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
