import 'package:flutter/material.dart';
import 'package:grocery_app_admin_panel/consts/constant.dart';
import 'package:grocery_app_admin_panel/responsive.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
    required this.backgroundColor,
  });

  final VoidCallback onPressed;
  final String text;
  final IconData icon;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        onPressed();
      },
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(
          horizontal: defaultPading * 1.5,
          vertical: defaultPading / (Responsive.isDesktop(context) ? 1 : 2),
        ),
      ),
      icon: Icon(icon, size: 20, color: Colors.white),
      label: Text(text, style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }
}
