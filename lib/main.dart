import 'package:flutter/material.dart';
import 'package:grocery_app_admin_panel/consts/theme_data.dart';
import 'package:grocery_app_admin_panel/controller/menu_contoller.dart';
import 'package:grocery_app_admin_panel/provider/dar_theme_provider.dart';
import 'package:grocery_app_admin_panel/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getDarkTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MenuContoller()),
        ChangeNotifierProvider(create: (_) => themeChangeProvider),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Grocery App Admin Panel',
            theme: Styles.themeData(themeProvider.darkTheme, context),
            home: MainScreen(),
          );
        },
      ),
    );
  }
}
