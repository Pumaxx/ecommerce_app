import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce_app/View/models/prouct_model.dart';
import 'package:ecommerce_app/View/models/wishlist_model.dart';
import 'package:ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishlist;

  const ProductCard({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.product,
    this.leftPosition = 0,
    this.widthFactor = 2.5,
    this.isWishlist = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product);
      },
      child: Stack(
        children: [
          SizedBox(
            width: (screenWidth / widthFactor),
            height: screenHeight / 5.5,
            child: Image.network(product.imageUrl, fit: BoxFit.cover),
          ),
          Positioned(
            top: screenHeight / 13,
            left: ((screenWidth / 2.5) / 25) + screenWidth * leftPosition,
            child: Container(
                width: (screenWidth / widthFactor - 10) -
                    (screenWidth * leftPosition * 1.125),
                height: screenHeight / 10.5,
                decoration: BoxDecoration(
                  color: const Color(0xFF1D2671)
                      .withAlpha(leftPosition > 0 ? 195 : 130),
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
                      BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          if (state is CartLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is CartLoaded) {
                            return Expanded(
                              child: IconButton(
                                  onPressed: () {
                                    context
                                        .read<CartBloc>()
                                        .add(CartProductAdd(product));
                                  },
                                  icon: const Icon(
                                    Icons.add_circle,
                                    color: Colors.white,
                                  )),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                      isWishlist
                          ? Expanded(
                              child: BlocBuilder<WishlistBloc, WishlistState>(
                                builder: (context, state) {
                                  return IconButton(
                                      onPressed: () {
                                        context.read<WishlistBloc>().add(
                                            RemoveWishlistProduct(product));
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ));
                                },
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
