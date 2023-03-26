import 'package:ecommerce_app/View/utils/custom_bars.dart';
import 'package:flutter/material.dart';

class CarteScreen extends StatelessWidget {
  const CarteScreen({super.key});

  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CarteScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double screenHeight =
        MediaQuery.of(context).size.height - statusBarHeight;
    final double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: CustomAppBar(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          title: 'Cart',
        ),
        bottomNavigationBar: CustomNavBar(screenHeight: screenHeight),
      ),
    );
  }
}
