import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/View/models/prouct_model.dart';
import 'package:ecommerce_app/View/utils/custom_bars.dart';
import 'package:ecommerce_app/View/widgets/hero_carousel_card.dart';
import 'package:ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/category_model.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    super.key,
    required this.product,
  });

  final Product product;
  static const String routeName = '/product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => ProductScreen(product: product),
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
          title: product.name,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment(-1.0, 1.0),
                  end: Alignment(1.0, -1.0),
                  colors: [
                    Color(0xFF1D2671),
                    Color(0xFFC33764),
                  ]),
            ),
            child: BottomAppBar(
              color: Colors.transparent,
              child: SizedBox(
                height: screenHeight * 0.075,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                    ),
                    BlocBuilder<WishlistBloc, WishlistState>(
                      builder: (context, state) {
                        return IconButton(
                          onPressed: () {
                            context
                                .read<WishlistBloc>()
                                .add(AddWishlistProduct(product));

                            const snackBar = SnackBar(
                              content: Text('Added to your Wishlist'),
                              duration: Duration(seconds: 1),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () {
                            context
                                .read<CartBloc>()
                                .add(CartProductAdd(product));
                            Navigator.pushNamed(context, '/cart');
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          child: AutoSizeText(
                            'ADD TO CARD',
                            style: TextStyle(
                              color: const Color(0xFF1D2671),
                              fontWeight: FontWeight.bold,
                              fontSize: screenHeight * 0.018,
                              fontFamily: 'Avenir',
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: [
                HeroCarouselCard(product: product),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Stack(
                children: [
                  Container(
                    width: screenWidth,
                    height: 60,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: const Alignment(-1.0, 1.0),
                          end: const Alignment(2.0, -1.0),
                          colors: [
                            const Color(0xFF1D2671).withAlpha(130),
                            const Color(0xFFC33764).withAlpha(130),
                          ]),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    width: screenWidth - 10,
                    height: 50,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment(-1.0, 1.0),
                          end: Alignment(1.0, -1.0),
                          colors: [
                            Color(0xFF1D2671),
                            Color(0xFFC33764),
                          ]),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              fontWeight: FontWeight.bold,
                              fontSize: screenHeight * 0.02,
                              fontFamily: 'Avenir',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: AutoSizeText(
                  'Product Information',
                  style: TextStyle(
                    color: const Color(0xFFC33764).withAlpha(420),
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight * 0.021,
                    fontFamily: 'Avenir',
                  ),
                ),
                children: [
                  ListTile(
                    title: AutoSizeText(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w500,
                        fontSize: screenHeight * 0.019,
                        fontFamily: 'Avenir',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: AutoSizeText(
                  'Delivery Information',
                  style: TextStyle(
                    color: const Color(0xFFC33764).withAlpha(420),
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight * 0.021,
                    fontFamily: 'Avenir',
                  ),
                ),
                children: [
                  ListTile(
                    title: AutoSizeText(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w500,
                        fontSize: screenHeight * 0.019,
                        fontFamily: 'Avenir',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
