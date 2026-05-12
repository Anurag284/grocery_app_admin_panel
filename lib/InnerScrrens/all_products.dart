import 'package:flutter/material.dart';
import 'package:grocery_app_admin_panel/Services/utils.dart';
import 'package:grocery_app_admin_panel/consts/constant.dart';
import 'package:grocery_app_admin_panel/controller/menu_contoller.dart';
import 'package:grocery_app_admin_panel/responsive.dart';
import 'package:grocery_app_admin_panel/screens/dashboard_screen.dart';
import 'package:grocery_app_admin_panel/widgets/grid_product.dart';
import 'package:grocery_app_admin_panel/widgets/header.dart';
import 'package:grocery_app_admin_panel/widgets/side_menu.dart';
import 'package:provider/provider.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).screenSize;
    return Scaffold(
      key: context.read<MenuContoller>().getGridScaffoldKey,
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
                        fct: () {
                          context.read<MenuContoller>().controlProductsMenu();
                        },
                      ),
                      SizedBox(height: defaultPading),
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
                          isInMain: false,
                        ),
                        desktop: ProductGrid(
                          crossAxisCount: 4,
                          childAspectRation: size.width < 1400 ? 0.8 : 1.15,
                          isInMain: false,
                        ),
                      ),
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
