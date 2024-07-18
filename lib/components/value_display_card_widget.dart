import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'value_display_card_model.dart';
export 'value_display_card_model.dart';

class ValueDisplayCardWidget extends StatefulWidget {
  const ValueDisplayCardWidget({super.key});

  @override
  State<ValueDisplayCardWidget> createState() => _ValueDisplayCardWidgetState();
}

class _ValueDisplayCardWidgetState extends State<ValueDisplayCardWidget> {
  late ValueDisplayCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ValueDisplayCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Text(
        '',
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Manrope',
              letterSpacing: 0.0,
            ),
      ),
    );
  }
}
