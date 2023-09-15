import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpansibleContainer extends StatefulWidget {
  final bool expanded;
  final double? initalHeight;

  const ExpansibleContainer({
    this.expanded = false,
    this.initalHeight,
    super.key,
  });

  @override
  State<ExpansibleContainer> createState() => _ExpansibleContainerState();
}

class _ExpansibleContainerState extends State<ExpansibleContainer> {
  late double _height;

  @override
  void initState() {
    _height = widget.expanded ? (widget.initalHeight ?? 230) : 25;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget(
      onWillAccept: (data) {
        setState(() {
          _height = 230;
        });
        return false;
      },
      onLeave: (data) {
        setState(() {
          _height = widget.initalHeight ?? 25;
        });
      },
      builder: (context, candidateData, rejectedData) {
        return AnimatedContainer(
          height: _height,
          duration: const Duration(milliseconds: 120),
        );
      },
    );
  }
}
