import 'package:flutter/material.dart';
import 'package:grocery_app_admin_panel/Services/utils.dart';
import 'package:grocery_app_admin_panel/consts/constant.dart';
import 'package:grocery_app_admin_panel/controller/menu_contoller.dart';
import 'package:grocery_app_admin_panel/responsive.dart';
import 'package:grocery_app_admin_panel/screens/dashboard_screen.dart';
import 'package:grocery_app_admin_panel/widgets/grid_product.dart';
import 'package:grocery_app_admin_panel/widgets/header.dart';
import 'package:grocery_app_admin_panel/widgets/order_list.dart';
import 'package:grocery_app_admin_panel/widgets/side_menu.dart';
import 'package:provider/provider.dart';

class AllOrderScreen extends StatefulWidget {
  const AllOrderScreen({super.key});

  @override
  State<AllOrderScreen> createState() => _AllOrderScreenState();
}

class _AllOrderScreenState extends State<AllOrderScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).screenSize;
    return Scaffold(
      key: context.read<MenuContoller>().getOrderScaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context)) Expanded(child: SideMenu()),
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(defaultPading),
                  child: Column(
                    children: [
                      Header(
                        title: 'All Orders',
                        fct: () {
                          context.read<MenuContoller>().controlOrderMenu();
                        },
                      ),
                      SizedBox(height: defaultPading),
                      OrderList(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
