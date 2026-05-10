import 'package:flutter/material.dart';
import 'package:grocery_app_admin_panel/Services/utils.dart';
import 'package:grocery_app_admin_panel/consts/constant.dart';
import 'package:grocery_app_admin_panel/responsive.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.fct});
  final Function fct;

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final color = Utils(context).color;
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            onPressed: () {
              fct();
            },
            icon: Icon(Icons.menu),
          ),
        if (Responsive.isDesktop(context))
          Padding(
            padding: EdgeInsets.all(defaultPading),
            child: Text(
              'DashBoard',
              style: TextStyle(color: color, fontSize: 20),
            ),
          ),
        if (Responsive.isDesktop(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              hintStyle: TextStyle(color: color),
              fillColor: Theme.of(context).cardColor,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
              ),
              suffixIcon: InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(defaultPading),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Icon(Icons.search, size: 25),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
