import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/View/models/category_model.dart';
import 'package:ecommerce_app/View/utils/custom_bars.dart';
import 'package:flutter/material.dart';
import '../utils/hero_carousel_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
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
          title: 'E_Commerce App',
        ),
        bottomNavigationBar: CustomNavBar(screenHeight: screenHeight),
        body: SizedBox(
            child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1.5,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
          ),
          items: Category.categories
              .map((category) => HeroCarouselCard(category: category))
              .toList(),
        )),
      ),
    );
  }
}
