import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce_app/View/models/prouct_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  const ProductCard({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.product,
    this.widthFactor = 2.5,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: screenWidth / widthFactor,
          height: screenHeight / 5.5,
          child: Image.network(product.imageUrl, fit: BoxFit.cover),
        ),
        Positioned(
          top: screenHeight / 13,
          left: (screenWidth / 2.5) / 25,
          child: Container(
              width: screenWidth / widthFactor - 10,
              height: screenHeight / 10.5,
              decoration: BoxDecoration(
                color: const Color(0xFF1D2671).withAlpha(130),
              ),
              child: Padding(
                padding: EdgeInsets.all(screenHeight / 100),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            product.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: screenHeight * 0.02,
                              fontFamily: 'Avenir',
                            ),
                          ),
                          AutoSizeText(
                            '\$${product.price}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.018,
                              fontFamily: 'Avenir',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add_circle,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              )),
        )
      ],
    );
  }
}
