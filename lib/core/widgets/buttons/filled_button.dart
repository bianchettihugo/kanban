import 'package:kanban/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class ButtonFilled extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData? icon;
  final String text;
  final bool enabled;

  const ButtonFilled({
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
      child: ElevatedButton.icon(
        icon: icon != null ? Icon(icon) : const SizedBox(),
        label: Text(
          text,
          style: context.text.labelLarge?.copyWith(
            color: context.color.onPrimary,
          ),
        ),
        onPressed: enabled ? onPressed : null,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            enabled ? context.theme.primaryColor : context.theme.disabledColor,
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
