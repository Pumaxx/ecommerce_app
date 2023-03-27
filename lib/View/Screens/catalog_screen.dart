import 'package:ecommerce_app/View/models/category_model.dart';
import 'package:ecommerce_app/View/models/prouct_model.dart';
import 'package:ecommerce_app/View/utils/custom_bars.dart';
import 'package:ecommerce_app/View/widgets/product_card.dart';
import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => CatalogScreen(category: category),
    );
  }

  final Category category;

  const CatalogScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double screenHeight =
        MediaQuery.of(context).size.height - statusBarHeight;
    final double screenWidth = MediaQuery.of(context).size.width;

    final List<Product> categoryProducts = Product.products
        .where((product) => product.category == category.name)
        .toList();

    return SafeArea(
      top: true,
      child: Scaffold(
          appBar: CustomAppBar(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            title: category.name,
          ),
          bottomNavigationBar: CustomNavBar(screenHeight: screenHeight),
          body: GridView.builder(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1.15),
            itemCount: categoryProducts.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: ProductCard(
                  product: categoryProducts[index],
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  widthFactor: 2.3,
                ),
              );
            },
          )),
    );
  }
}
