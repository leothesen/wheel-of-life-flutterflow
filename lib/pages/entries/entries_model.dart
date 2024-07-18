import '/flutter_flow/flutter_flow_util.dart';
import 'entries_widget.dart' show EntriesWidget;
import 'package:flutter/material.dart';

class EntriesModel extends FlutterFlowModel<EntriesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
