import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class LabelButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final TextStyle? style;
  final BoxDecoration? boxDecoration;
  const LabelButton({Key? key, required this.label, required this.onPressed, this.style, this.boxDecoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 56,
        decoration: boxDecoration,
        child: TextButton(
            onPressed: onPressed,
            child: Text(
              label,
              style: style ?? TextStyles.buttonBoldHeading,
            )));
  }
}
