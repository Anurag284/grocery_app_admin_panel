import 'package:flutter/material.dart';
import 'package:grocery_app_admin_panel/consts/constant.dart';
import 'package:grocery_app_admin_panel/widgets/product_widget.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
    this.crossAxisCount = 4,
    this.childAspectRation = 1,
    this.isInMain = true,
  });
  final int crossAxisCount;
  final double childAspectRation;
  final bool isInMain;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: isInMain ? 4 : 20,
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
