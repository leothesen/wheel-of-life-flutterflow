import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'text_input_model.dart';
export 'text_input_model.dart';

class TextInputWidget extends StatefulWidget {
  const TextInputWidget({super.key});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  late TextInputModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextInputModel());

    _model.addValueTextController ??= TextEditingController();
    _model.addValueFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
      child: SizedBox(
        width: double.infinity,
        child: TextFormField(
          controller: _model.addValueTextController,
          focusNode: _model.addValueFocusNode,
          autofocus: true,
          autofillHints: const [AutofillHints.email],
          obscureText: false,
          decoration: InputDecoration(
            labelText: 'Add something that is important to you',
            labelStyle: FlutterFlowTheme.of(context).labelLarge.override(
                  fontFamily: 'Manrope',
                  letterSpacing: 0.0,
                ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).alternate,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(40.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).primary,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(40.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(40.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(40.0),
            ),
            filled: true,
            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
            contentPadding: const EdgeInsets.all(24.0),
          ),
          style: FlutterFlowTheme.of(context).bodyLarge.override(
                fontFamily: 'Manrope',
                letterSpacing: 0.0,
              ),
          keyboardType: TextInputType.emailAddress,
          validator:
              _model.addValueTextControllerValidator.asValidator(context),
        ),
      ),
    );
  }
}
