import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kanban/core/utils/extensions.dart';

class EditableContent extends StatefulWidget {
  final bool title;
  final String text;
  final String placeholder;

  const EditableContent({
    this.title = false,
    this.text = '',
    this.placeholder = '...',
    super.key,
  });

  @override
  State<EditableContent> createState() => _EditableContentState();
}

class _EditableContentState extends State<EditableContent> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  bool enabled = false;
  bool active = false;

  @override
  void initState() {
    controller.text = widget.text;
    focusNode.addListener(() {
      if (active && !focusNode.hasFocus && enabled) {
        setState(() {
          enabled = false;
        });
      }
      active = focusNode.hasFocus;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final style =
        (widget.title ? context.text.headlineSmall : context.text.labelMedium)!;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AutoSizeTextField(
          textAlign: TextAlign.center,
          fullwidth: false,
          controller: controller,
          focusNode: focusNode,
          enabled: enabled,
          minFontSize: 18,
          onSubmitted: (v) => setState(() {
            enabled = false;
          }),
          decoration: InputDecoration.collapsed(
            hintText: widget.placeholder,
          ),
          style: style.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Transform.translate(
          offset: const Offset(-4, 1),
          child: IconButton(
            color: context.theme.disabledColor,
            icon: const FaIcon(
              FontAwesomeIcons.pen,
              size: 14,
            ),
            onPressed: () {
              setState(() {
                enabled = true;
              });
              Future.delayed(const Duration(milliseconds: 100), () {
                controller.selection = TextSelection(
                  baseOffset: 0,
                  extentOffset: controller.value.text.length,
                );
                focusNode.requestFocus();
              });
            },
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }
}
