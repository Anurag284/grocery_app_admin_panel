import 'package:flutter/material.dart';
import 'package:grocery_app_admin_panel/consts/constant.dart';
import 'package:grocery_app_admin_panel/responsive.dart';
import 'package:grocery_app_admin_panel/widgets/grid_product.dart';
import 'package:grocery_app_admin_panel/widgets/header.dart';
import 'package:grocery_app_admin_panel/widgets/order_list.dart';
import 'package:provider/provider.dart';
import 'package:grocery_app_admin_panel/controller/menu_contoller.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
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
                          crossAxisCount:
                              size.width < 420
                                  ? 1
                                  : size.width < 850
                                  ? 2
                                  : 4,
                          childAspectRation:
                              size.width < 420
                                  ? 1.8
                                  : size.width < 850
                                  ? 0.8
                                  : 0.9,
                        ),
                        desktop: ProductGrid(
                          crossAxisCount: 4,
                          childAspectRation: size.width < 1400 ? 0.8 : 1.15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            OrderList(),
          ],
        ),
      ),
    );
  }
}
