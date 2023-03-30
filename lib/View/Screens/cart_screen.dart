import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce_app/View/utils/custom_bars.dart';
import 'package:ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/cart_model.dart';
import '../widgets/cart_product_card.dart';

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

    const cart = Cart();

    return SafeArea(
      top: true,
      child: Scaffold(
          appBar: CustomAppBar(
            screenHeight: screenHeight,
            screenWidth: screenWidth,
            title: 'Cart',
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
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade200),
                        child: AutoSizeText(
                          'GO TO CHECKOUT',
                          style: TextStyle(
                            color: const Color(0xFF1D2671),
                            fontWeight: FontWeight.bold,
                            fontSize: screenHeight * 0.018,
                            fontFamily: 'Avenir',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CartLoaded) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText(
                                state.cart.freeDelivery(),
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenHeight * 0.02,
                                  fontFamily: 'Avenir',
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFC33764),
                                  ),
                                  child: AutoSizeText(
                                    'Add More Items',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenHeight * 0.02,
                                      fontFamily: 'Avenir',
                                    ),
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: screenHeight / 80,
                          ),
                          SizedBox(
                            height: screenHeight * 0.56,
                            child: ListView.builder(
                                itemCount: state.cart
                                    .productsQuantity(state.cart.products)
                                    .keys
                                    .length,
                                itemBuilder: (context, index) {
                                  return CardProductCard(
                                    product: state.cart
                                        .productsQuantity(state.cart.products)
                                        .keys
                                        .elementAt(index),
                                    quantity: state.cart
                                        .productsQuantity(state.cart.products)
                                        .values
                                        .elementAt(index),
                                    screenHeight: screenHeight,
                                    screenWidth: screenWidth,
                                  );
                                }),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Divider(
                            thickness: 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText(
                                      'SUBTOTAL',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.w700,
                                        fontSize: screenHeight * 0.02,
                                        fontFamily: 'Avenir',
                                      ),
                                    ),
                                    AutoSizeText(
                                      '\$${state.cart.subtotalString}',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.w700,
                                        fontSize: screenHeight * 0.02,
                                        fontFamily: 'Avenir',
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: screenHeight / 80,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText(
                                      'DELIVERY FEE',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.w700,
                                        fontSize: screenHeight * 0.02,
                                        fontFamily: 'Avenir',
                                      ),
                                    ),
                                    AutoSizeText(
                                      '\$${state.cart.deliveryFeeString}',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.w700,
                                        fontSize: screenHeight * 0.02,
                                        fontFamily: 'Avenir',
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Stack(
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
                                        const Color(0xFFC33764).withAlpha(130),
                                        const Color(0xFF1D2671).withAlpha(130),
                                      ]),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(5.0),
                                width: screenWidth - 10,
                                height: 50,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: const Alignment(-1.0, 1.0),
                                      end: const Alignment(1.0, -1.0),
                                      colors: [
                                        const Color(0xFFC33764).withAlpha(220),
                                        const Color(0xFF1D2671).withAlpha(220),
                                      ]),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AutoSizeText(
                                        'TOTAL',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: screenHeight * 0.02,
                                          fontFamily: 'Avenir',
                                        ),
                                      ),
                                      AutoSizeText(
                                        '\$${state.cart.totalString}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
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
                        ],
                      ),
                    ],
                  ),
                );
              }
              return const Text('Semethin went wrong.');
            },
          )),
    );
  }
}
