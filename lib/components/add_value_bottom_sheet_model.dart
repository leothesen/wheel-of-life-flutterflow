import '/components/text_input_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_value_bottom_sheet_widget.dart' show AddValueBottomSheetWidget;
import 'package:flutter/material.dart';

class AddValueBottomSheetModel
    extends FlutterFlowModel<AddValueBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for TextInput component.
  late TextInputModel textInputModel;

  @override
  void initState(BuildContext context) {
    textInputModel = createModel(context, () => TextInputModel());
  }

  @override
  void dispose() {
    textInputModel.dispose();
  }
}
