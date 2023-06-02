import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kanban/core/utils/extensions.dart';
import 'package:kanban/core/widgets/date_picker.dart';

class KanbanCard extends StatefulWidget {
  final String title;
  final String description;
  final int index;

  const KanbanCard({
    this.title = '',
    this.description = '',
    this.index = 0,
    super.key,
  });

  @override
  State<KanbanCard> createState() => _KanbanCardState();
}

class _KanbanCardState extends State<KanbanCard> {
  final FocusNode titleFocus = FocusNode();
  final FocusNode descriptionFocus = FocusNode();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool editable = false;
  bool active = false;

  @override
  void initState() {
    titleController.text = widget.title;
    descriptionController.text = widget.description;

    titleFocus.addListener(() {
      if (active &&
          !titleFocus.hasFocus &&
          !descriptionFocus.hasFocus &&
          editable) {
        setState(() {
          editable = false;
        });
      }
      active = titleFocus.hasFocus;
    });

    descriptionFocus.addListener(() {
      if (active &&
          !titleFocus.hasFocus &&
          !descriptionFocus.hasFocus &&
          editable) {
        setState(() {
          editable = false;
        });
      }
      active = descriptionFocus.hasFocus;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 15,
      ),
      margin: const EdgeInsets.only(bottom: 15),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 6,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onDoubleTap: !editable
                        ? () {
                            if (!editable) {
                              setState(() {
                                editable = true;
                              });
                            }
                            Future.delayed(const Duration(milliseconds: 100),
                                () {
                              titleController.selection = TextSelection(
                                baseOffset: 0,
                                extentOffset: titleController.value.text.length,
                              );
                              titleFocus.requestFocus();
                            });
                          }
                        : null,
                    child: TextFormField(
                      textAlign: TextAlign.start,
                      controller: titleController,
                      focusNode: titleFocus,
                      enabled: editable,
                      onFieldSubmitted: (v) => setState(() {
                        editable = false;
                      }),
                      decoration: const InputDecoration.collapsed(
                        hintText: '...',
                      ),
                      style: context.text.bodyMedium.bold,
                    ),
                  ),
                ),
                ExcludeFocus(
                  child: PopupMenuButton<int>(
                    initialValue: null,
                    tooltip: '',
                    color: context.theme.cardColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                      side: BorderSide(
                        width: 0.5,
                        color: context.theme.disabledColor.withOpacity(0.4),
                      ),
                    ),
                    onSelected: (int item) {
                      if (item == 0) {
                        if (!editable) {
                          setState(() {
                            editable = true;
                          });
                        }
                        Future.delayed(const Duration(milliseconds: 100), () {
                          titleController.selection = TextSelection(
                            baseOffset: 0,
                            extentOffset: titleController.value.text.length,
                          );
                          titleFocus.requestFocus();
                        });
                      }
                    },
                    child: Transform.translate(
                      offset: const Offset(0, -3),
                      child: IconButton(
                        mouseCursor: SystemMouseCursors.click,
                        icon: FaIcon(
                          FontAwesomeIcons.ellipsisVertical,
                          color: context.theme.disabledColor,
                          size: 14,
                        ),
                        onPressed: null,
                      ),
                    ),
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem<int>(
                        value: 0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.pen,
                              color: context.theme.disabledColor,
                              size: 14,
                            ),
                            const SizedBox(width: 10),
                            const Text('Edit'),
                          ],
                        ),
                      ),
                      PopupMenuItem<int>(
                        value: 1,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.trash,
                              color: context.theme.disabledColor,
                              size: 14,
                            ),
                            const SizedBox(width: 10),
                            const Text('Delete'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.maxFinite,
              child: GestureDetector(
                onDoubleTap: !editable
                    ? () {
                        setState(() {
                          editable = true;
                        });
                        Future.delayed(const Duration(milliseconds: 100), () {
                          descriptionController.selection = TextSelection(
                            baseOffset: 0,
                            extentOffset:
                                descriptionController.value.text.length,
                          );
                          descriptionFocus.requestFocus();
                        });
                      }
                    : null,
                child: TextFormField(
                  textAlign: TextAlign.start,
                  controller: descriptionController,
                  focusNode: descriptionFocus,
                  enabled: editable,
                  maxLines: 4,
                  onFieldSubmitted: (v) => setState(() {
                    editable = false;
                  }),
                  decoration: const InputDecoration.collapsed(
                    hintText: 'Task description...',
                  ),
                  style: context.text.bodyMedium!.copyWith(
                    color: context.theme.disabledColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Divider(
              color: context.theme.disabledColor,
              thickness: 0.5,
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0.5),
                  child: FaIcon(
                    FontAwesomeIcons.calendar,
                    color: context.theme.disabledColor,
                    size: 14,
                  ),
                ),
                const SizedBox(width: 8),
                DatePicker(
                  enabled: editable,
                  onChange: (date) {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleFocus.dispose();
    titleController.dispose();
    descriptionFocus.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
