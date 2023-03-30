import 'package:ecommerce_app/View/Screens/cart_screen.dart';
import 'package:ecommerce_app/View/Screens/catalog_screen.dart';
import 'package:ecommerce_app/View/Screens/home_screen.dart';
import 'package:ecommerce_app/View/Screens/product_screen.dart';
import 'package:ecommerce_app/View/Screens/wishlist_screen.dart';
import 'package:ecommerce_app/Model/models/category_model.dart';
import 'package:flutter/material.dart';

import '../../Model/models/prouct_model.dart';

class AppRouter {
  static Route onGenereteRoute(RouteSettings settings) {
    debugPrint('This is route: ${settings.name}');

    switch (settings.name) {
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CarteScreen.routeName:
        return CarteScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case WisthlistScreen.routeName:
        return WisthlistScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
      ),
    );
  }
}
