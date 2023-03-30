import 'package:flutter/material.dart';
import '../../Model/models/prouct_model.dart';
import 'product_card.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;
  const ProductCarousel({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.products,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight / 4.75,
      child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth / 20, vertical: screenHeight / 90),
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: screenWidth / 80),
              child: ProductCard(
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                  product: products[index]),
            );
          }),
    );
  }
}
