import 'package:flutter/material.dart';
import 'package:grocery_app_admin_panel/InnerScrrens/all_orders.dart';
import 'package:grocery_app_admin_panel/InnerScrrens/all_products.dart';
import 'package:grocery_app_admin_panel/Services/utils.dart';
import 'package:grocery_app_admin_panel/provider/dar_theme_provider.dart';
import 'package:grocery_app_admin_panel/screens/main_screen.dart';
import 'package:grocery_app_admin_panel/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final themeState = Provider.of<DarkThemeProvider>(context);
    final color = Utils(context).color;
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        children: [
          DrawerHeader(child: Image.asset('assets/groceries.png')),
          DrawerListTile(
            title: 'Main',
            press: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => MainScreen()),
              );
            },
            icon: Icons.home_filled,
          ),
          DrawerListTile(
            title: 'View all product',
            press: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AllProductScreen()),
              );
            },
            icon: Icons.store,
          ),
          DrawerListTile(
            title: 'View all order',
            press: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AllOrderScreen()),
              );
            },
            icon: Icons.shopping_bag,
          ),
          SwitchListTile(
            title: Text('Theme', style: TextStyle(color: color)),
            secondary: Icon(
              themeState.darkTheme
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
              color: color,
            ),
            value: theme,
            onChanged: (value) {
              setState(() {
                themeState.setDarkTheme = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.press,
    required this.icon,
  }) : super(key: key);

  final String title;
  final VoidCallback press;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    final color = theme == true ? Colors.white : Colors.black;

    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(icon, size: 18),
      title: TextWidget(title: title, color: color, textSize: 18),
    );
  }
}
