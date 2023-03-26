import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final double? screenHeight;
  final double? screenWidth;
  final String? title;
  const CustomAppBar({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          gradient: LinearGradient(
              begin: Alignment(-0.8, -1.0),
              end: Alignment(1.0, 0.8),
              colors: [
                Color(0xFF1D2671),
                Color(0xFFC33764),
              ]),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth! * 0.047,
          vertical: screenHeight! * 0.013,
        ),
        child: AutoSizeText(
          title!,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: screenHeight! * 0.032,
            // fontFamily: 'Avenir',
          ),
        ),
      ),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: const Color(0xFFC33764),
        size: screenHeight! * 0.042,
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/wishlist');
          },
          icon: const Icon(
            Icons.favorite,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(screenHeight! * 0.065);
}

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/user');
                },
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
