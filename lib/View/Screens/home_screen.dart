import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/View/utils/custom_bars.dart';
import 'package:ecommerce_app/ViewModel/category/category_bloc.dart';
import 'package:ecommerce_app/ViewModel/products/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Model/models/prouct_model.dart';
import '../widgets/hero_carousel_card.dart';
import '../widgets/section_title.dart';
import '../widgets/product_carousel.dart';

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
        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is CategoryLoaded) {
                      return CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 1.5,
                          viewportFraction: 0.9,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                        ),
                        items: state.categories
                            .map((category) =>
                                HeroCarouselCard(category: category))
                            .toList(),
                      );
                    }
                    return const Text('Something went wrong.');
                  },
                ),
                SectionTitile(
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    title: 'RCOMMENDED'),
                BlocBuilder<ProductsBloc, ProductsState>(
                  builder: (context, state) {
                    if (state is ProductsLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is ProductsLoaded) {
                      return ProductCarousel(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          products: state.products
                              .where((product) => product.isRecommended)
                              .toList());
                    }
                    return const Text('Something went wrong.');
                  },
                ),
                SectionTitile(
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    title: 'MOST POPULAR'),
                BlocBuilder<ProductsBloc, ProductsState>(
                  builder: (context, state) {
                    if (state is ProductsLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is ProductsLoaded) {
                      return ProductCarousel(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          products: state.products
                              .where((product) => product.isPopular)
                              .toList());
                    }
                    return const Text('Something went wrong.');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
