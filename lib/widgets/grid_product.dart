import 'package:flutter/material.dart';
import 'package:grocery_app_admin_panel/Services/utils.dart';
import 'package:grocery_app_admin_panel/consts/constant.dart';
import 'package:grocery_app_admin_panel/widgets/product_widget.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
    this.crossAxisCount = 5,
    this.childAspectRation = 1,
  });
  final int crossAxisCount;
  final double childAspectRation;
  // final bool isInMain;

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).screenSize;
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRation,
        crossAxisSpacing: defaultPading,
        mainAxisSpacing: defaultPading,
      ),
      itemBuilder: (context, index) {
        return ProductWidget();
      },
    );
  }
}
