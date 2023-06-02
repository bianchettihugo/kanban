import 'package:flutter/material.dart';
import 'package:kanban/core/utils/extensions.dart';

class DatePicker extends StatefulWidget {
  final DateTime? initialDate;

  final DateTime? firstDate;

  final DateTime? lastDate;

  final ValueChanged<DateTime?> onChange;

  final TextStyle? style;

  final double width;
  final double height;

  final double overlayVerticalPosition;
  final double overlayHorizontalPosiition;

  final InputDecoration? inputDecoration;

  final Widget? prefix;

  final String dateformat;

  final bool enabled;

  const DatePicker({
    Key? key,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    required this.onChange,
    this.style,
    this.width = 200,
    this.height = 36,
    this.prefix,
    this.dateformat = 'dd/MM/yyyy',
    this.overlayVerticalPosition = 5.0,
    this.overlayHorizontalPosiition = 0.0,
    this.inputDecoration,
    this.enabled = true,
  }) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final FocusNode _focusNode = FocusNode();

  late OverlayEntry _overlayEntry;

  final LayerLink _layerLink = LayerLink();

  final _controller = TextEditingController();

  late DateTime? _selectedDate;
  late DateTime _firstDate;
  late DateTime _lastDate;

  bool _isEnterCalendar = false;

  bool overlay = false;

  @override
  void initState() {
    super.initState();

    _selectedDate = widget.initialDate;
    _firstDate = widget.firstDate ?? DateTime(2000);
    _lastDate = widget.lastDate ?? DateTime(2100);

    if (_selectedDate != null) {
      _controller.text = _selectedDate?.parseToString(widget.dateformat) ?? '';
    }

    _focusNode.addListener(() {
      if (_focusNode.hasFocus && !overlay) {
        _overlayEntry = _createOverlayEntry();
        Overlay.of(context).insert(_overlayEntry);
        overlay = true;
      } else {
        if (_isEnterCalendar) {
          _focusNode.requestFocus();
          return;
        }

        if (overlay) {
          final yesterday = DateTime.now().subtract(const Duration(days: 1));
          final tomorrow = DateTime.now().add(const Duration(days: 1));
          if (_selectedDate.equals(DateTime.now())) {
            _controller.text = 'Today';
          } else if (_selectedDate.equals(yesterday)) {
            _controller.text = 'Yesterday';
          } else if (_selectedDate.equals(tomorrow)) {
            _controller.text = 'Tomorrow';
          } else {
            _controller.text = _selectedDate.parseToString(widget.dateformat);
          }

          widget.onChange.call(_selectedDate);
          _overlayEntry.remove();
          overlay = false;
        }
      }
    });
  }

  void onChange(DateTime? selectedDate) {
    if (selectedDate == _selectedDate) {
      _selectedDate = null;
      _controller.text = '';
    } else {
      _selectedDate = selectedDate;
      _controller.text = _selectedDate.parseToString(widget.dateformat);
    }

    _isEnterCalendar = false;
    _focusNode.unfocus();
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Positioned(
        width: 300,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(widget.overlayHorizontalPosiition,
              widget.overlayVerticalPosition),
          child: Material(
            elevation: 5,
            child: SizedBox(
              height: 250,
              child: MouseRegion(
                onEnter: (_) {
                  _isEnterCalendar = true;
                },
                onExit: (_) {
                  _isEnterCalendar = false;
                },
                child: CalendarDatePicker(
                  firstDate: _firstDate,
                  lastDate: _lastDate,
                  initialDate: _selectedDate ?? DateTime.now(),
                  onDateChanged: onChange,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: SizedBox(
        width: widget.width,
        child: TextFormField(
          focusNode: _focusNode,
          controller: _controller,
          style: context.text.bodyMedium!.copyWith(
            color: context.theme.disabledColor,
          ),
          decoration: widget.inputDecoration ??
              InputDecoration.collapsed(
                hintText: 'Add date',
                hintStyle: context.text.bodyMedium!.copyWith(
                  color: context.theme.disabledColor,
                ),
              ),
          onChanged: (dateString) {
            final date = dateString.parseToDateTime(widget.dateformat);
            if (date.isBefore(_firstDate)) {
              _selectedDate = _firstDate;
            } else if (date.isAfter(_lastDate)) {
              _selectedDate = _lastDate;
            } else {
              _selectedDate = date;
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
