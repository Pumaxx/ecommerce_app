import 'package:ecommerce_app/View/utils/custom_bars.dart';
import 'package:flutter/material.dart';

class WisthlistScreen extends StatelessWidget {
  const WisthlistScreen({super.key});

  static const String routeName = '/wishlist';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const WisthlistScreen(),
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
          title: 'Wishlist',
        ),
        bottomNavigationBar: CustomNavBar(screenHeight: screenHeight),
      ),
    );
  }
}
