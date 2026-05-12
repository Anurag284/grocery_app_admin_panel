import 'package:flutter/material.dart';
import 'package:grocery_app_admin_panel/Services/utils.dart';
import 'package:grocery_app_admin_panel/widgets/text_widget.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({super.key});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final color = theme == true ? Colors.white : Colors.black;
    final size = Utils(context).screenSize;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).canvasColor.withOpacity(0.4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: size.width < 650 ? 3 : 1,
              child: Image.network(
                'https://i.ibb.co/F0s3FHQ/Apricots.png',
                fit: BoxFit.fill,
                height: size.width * 0.12,
                width: size.width * 0.12,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextWidget(
                    title: '12x For \$19.9',
                    color: color,
                    textSize: 16,
                    isTitle: true,
                  ),
                  FittedBox(
                    child: Row(
                      children: [
                        TextWidget(
                          title: 'By',
                          color: Colors.blue,
                          textSize: 16,
                          isTitle: true,
                        ),
                        SizedBox(width: 6),
                        TextWidget(
                          title: 'Anurag',
                          color: color,
                          textSize: 14,
                          isTitle: true,
                        ),
                      ],
                    ),
                  ),
                  Text('12/05/2026'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
