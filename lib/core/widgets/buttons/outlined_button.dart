import 'package:kanban/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class ButtonOutlined extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData? icon;
  final String text;
  final bool enabled;

  const ButtonOutlined({
    required this.text,
    required this.onPressed,
    this.enabled = true,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton.icon(
        icon: icon != null ? Icon(icon) : const SizedBox(),
        label: Text(
          text,
          style: context.text.labelLarge?.copyWith(
            color: enabled
                ? context.theme.primaryColor
                : context.theme.disabledColor,
          ),
        ),
        onPressed: enabled ? onPressed : null,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 2,
            color: enabled
                ? context.theme.primaryColor
                : context.theme.disabledColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
