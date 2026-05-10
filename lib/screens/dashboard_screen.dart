import 'package:flutter/material.dart';
import 'package:grocery_app_admin_panel/consts/constant.dart';
import 'package:grocery_app_admin_panel/widgets/header.dart';
import 'package:provider/provider.dart';
import 'package:grocery_app_admin_panel/controller/menu_contoller.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPading),
        child: Column(
          children: [
            Header(
              fct: () {
                context.read<MenuContoller>().controlDashBoardMenu();
              },
            ),
            SizedBox(height: defaultPading),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      //MyProductHome()
                      //SizedBox(height: 10,),
                      //OrdersScreen()
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
