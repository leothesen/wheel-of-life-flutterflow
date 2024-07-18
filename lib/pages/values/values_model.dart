import '/components/add_button_widget.dart';
import '/components/back_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'values_widget.dart' show ValuesWidget;
import 'package:flutter/material.dart';

class ValuesModel extends FlutterFlowModel<ValuesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AddButton component.
  late AddButtonModel addButtonModel;
  // Model for BackButton component.
  late BackButtonModel backButtonModel;

  @override
  void initState(BuildContext context) {
    addButtonModel = createModel(context, () => AddButtonModel());
    backButtonModel = createModel(context, () => BackButtonModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    addButtonModel.dispose();
    backButtonModel.dispose();
  }
}
