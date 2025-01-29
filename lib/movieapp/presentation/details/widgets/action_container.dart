import 'package:flutter/material.dart';

class ActionContainer extends StatelessWidget {
  const ActionContainer(
      {super.key, required this.icon, this.iconColor = Colors.grey, this.onTap});

  final IconData icon;
  final Color? iconColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withValues(alpha: 0.2)),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
