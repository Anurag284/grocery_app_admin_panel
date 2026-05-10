import 'package:flutter/material.dart';
import 'package:grocery_app_admin_panel/controller/menu_contoller.dart';
import 'package:grocery_app_admin_panel/responsive.dart';
import 'package:grocery_app_admin_panel/screens/dashboard_screen.dart';
import 'package:grocery_app_admin_panel/widgets/side_menu.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuContoller>().getScaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context)) Expanded(child: SideMenu()),
            Expanded(flex: 5, child: DashboardScreen()),
          ],
        ),
      ),
    );
  }
}
