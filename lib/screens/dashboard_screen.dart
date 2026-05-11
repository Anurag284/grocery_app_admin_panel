import 'package:flutter/material.dart';
import 'package:grocery_app_admin_panel/Services/utils.dart';
import 'package:grocery_app_admin_panel/consts/constant.dart';
import 'package:grocery_app_admin_panel/responsive.dart';
import 'package:grocery_app_admin_panel/widgets/grid_product.dart';
import 'package:grocery_app_admin_panel/widgets/header.dart';
import 'package:grocery_app_admin_panel/widgets/product_widget.dart';
import 'package:provider/provider.dart';
import 'package:grocery_app_admin_panel/controller/menu_contoller.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).screenSize;
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
                      Responsive(
                        mobile: ProductGrid(
                          crossAxisCount: size.width < 650 ? 2 : 4,
                          childAspectRation:
                              size.width < 650 && size.width > 350 ? 1.1 : 0.8,
                        ),
                        desktop: ProductGrid(
                          childAspectRation: size.width < 1400 ? 0.8 : 1.05,
                        ),
                      ),
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
