import 'package:flutter/material.dart';
import 'package:grocery_app_admin_panel/Services/utils.dart';
import 'package:grocery_app_admin_panel/widgets/text_widget.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).screenSize;
    final color = Utils(context).color;
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor.withOpacity(0.7),
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Image.network(
                        'https://i.ibb.co/F0s3FHQ/Apricots.png',
                        fit: BoxFit.fill,
                        height: size.width * 0.12,
                      ),
                    ),
                    Spacer(),
                    PopupMenuButton(
                      itemBuilder:
                          (context) => [
                            PopupMenuItem(
                              onTap: () {},
                              value: 1,
                              child: Text('Edit'),
                            ),
                            PopupMenuItem(
                              onTap: () {},
                              value: 2,
                              child: Text(
                                'Delete',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    TextWidget(title: '\$1.99', color: color, textSize: 18),
                    SizedBox(width: 7),
                    Visibility(
                      visible: true,
                      child: Text(
                        '\$2.99',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: color,
                        ),
                      ),
                    ),
                    Spacer(),
                    TextWidget(title: '1Kg', color: color, textSize: 18),
                  ],
                ),
                SizedBox(height: 8),
                TextWidget(
                  title: 'Title',
                  color: color,
                  textSize: 24,
                  isTitle: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
