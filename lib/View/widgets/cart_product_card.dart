import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/prouct_model.dart';

class CardProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  final double screenHeight;
  final double screenWidth;

  const CardProductCard({
    Key? key,
    required this.product,
    required this.quantity,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight / 97.5),
      child: Row(
        children: [
          Image.network(
            product.imageUrl,
            width: screenWidth / 4,
            height: screenHeight / 9.75,
            fit: BoxFit.cover,
          ),
          SizedBox(width: screenWidth / 40),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  product.name,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight * 0.02,
                    fontFamily: 'Avenir',
                  ),
                ),
                AutoSizeText(
                  '\$${product.price}',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: screenHeight * 0.02,
                    fontFamily: 'Avenir',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: screenWidth / 40),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Row(
                children: [
                  IconButton(
                      onPressed: () {
                        context
                            .read<CartBloc>()
                            .add(CartProductRemove(product));
                      },
                      icon: const Icon(Icons.remove_circle)),
                  AutoSizeText(
                    '$quantity',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight * 0.02,
                      fontFamily: 'Avenir',
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        context.read<CartBloc>().add(CartProductAdd(product));
                      },
                      icon: const Icon(Icons.add_circle)),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
