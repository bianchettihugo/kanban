import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kanban/core/utils/extensions.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(1, 0),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: context.theme.primaryColor,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 13,
            ),
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.bolt,
                size: 21,
                color: context.color.onPrimary,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SidebarButton(
            active: selectedIndex == 0,
            icon: FontAwesomeIcons.house,
            onPressed: () => setState(() {
              selectedIndex = 0;
            }),
          ),
          SidebarButton(
            active: selectedIndex == 1,
            icon: FontAwesomeIcons.solidFolderOpen,
            onPressed: () => setState(() {
              selectedIndex = 1;
            }),
          ),
          SidebarButton(
            active: selectedIndex == 2,
            icon: FontAwesomeIcons.gear,
            onPressed: () => setState(() {
              selectedIndex = 2;
            }),
          ),
        ],
      ),
    );
  }
}

class SidebarButton extends StatelessWidget {
  final bool active;
  final VoidCallback onPressed;
  final IconData icon;

  const SidebarButton({
    required this.onPressed,
    required this.icon,
    this.active = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 6,
      ),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: active
            ? context.theme.primaryColor.withOpacity(0.2)
            : context.theme.cardColor,
        border: active
            ? Border(
                right:
                    BorderSide(width: 3.0, color: context.theme.primaryColor),
              )
            : null,
      ),
      child: IconButton(
        icon: FaIcon(
          icon,
          size: 21,
          color: context.theme.dividerColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
