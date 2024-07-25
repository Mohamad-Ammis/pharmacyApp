import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyFavoriteBody extends StatelessWidget {
  const EmptyFavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Lottie.asset('assets/lottie/favoriteSmile.json'),
        ),
        const Text(
          'Favorites is Empty',
          style: TextStyle(fontSize: 32),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          child: Text(
            'Lets Go to Products Page Where You Can See All Product And Add To Favorite What You Like',
            style: TextStyle(),
          ),
        ),
      ],
    );
  }
}
