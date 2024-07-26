import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cloud_function_test_widget.dart' show CloudFunctionTestWidget;
import 'package:flutter/material.dart';

class CloudFunctionTestModel extends FlutterFlowModel<CloudFunctionTestWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Cloud Function - helloWorldCloudFunction] action in Button widget.
  HelloWorldCloudFunctionCloudFunctionCallResponse?
      helloWorldCloudFunctionResponse;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
