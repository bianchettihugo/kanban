import 'package:kanban/core/widgets/utils/extensions.dart';
import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData? icon;
  final TextStyle? textStyle;
  final String text;
  final bool enabled;
  final bool button;

  const ButtonText({
    required this.text,
    required this.onPressed,
    this.enabled = true,
    this.button = false,
    this.textStyle,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final style = textStyle ?? context.text.labelLarge;
    return SizedBox(
      width: button ? double.infinity : null,
      height: button ? 50 : null,
      child: TextButton.icon(
        icon: icon != null ? Icon(icon) : const SizedBox(),
        label: Text(
          text,
          style: style?.copyWith(
            color: enabled
                ? context.theme.primaryColor
                : context.theme.disabledColor,
          ),
        ),
        style: TextButton.styleFrom(
          visualDensity: button ? null : VisualDensity.compact,
        ),
        onPressed: enabled ? onPressed : null,
      ),
    );
  }
}
