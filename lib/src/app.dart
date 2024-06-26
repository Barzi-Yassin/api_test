import 'package:flutter/material.dart';

import 'package:api_test/src/features/products/presentation/screens/detail_screen.dart';
import 'package:api_test/src/features/products/presentation/screens/products_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _themeData(),
      initialRoute: Routes.initialRoute,
      routes: {
        Routes.initialRoute: (context) => const ProductsScreen(),
        Routes.productsScreen: (context) => const ProductsScreen(),
        Routes.detailScreen: (context) => const DetailScreen(),
      },
    );
  }

  ThemeData _themeData() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blueGrey.shade300,
        foregroundColor: Colors.white,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(Colors.black87),
        trackColor: MaterialStateProperty.all(Colors.white24),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: Colors.blueGrey.shade700,
      ),
    );
  }
}

class Routes {
  static const String initialRoute = "/";
  static const String productsScreen = "product";
  static const String detailScreen = "detail";
}
