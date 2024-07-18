import '/flutter_flow/flutter_flow_util.dart';
import 'text_input_widget.dart' show TextInputWidget;
import 'package:flutter/material.dart';

class TextInputModel extends FlutterFlowModel<TextInputWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for AddValue widget.
  FocusNode? addValueFocusNode;
  TextEditingController? addValueTextController;
  String? Function(BuildContext, String?)? addValueTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    addValueFocusNode?.dispose();
    addValueTextController?.dispose();
  }
}
