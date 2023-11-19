import 'package:flutter/material.dart';

class LogInStyle extends StatelessWidget {
  const LogInStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              'assets/assets/images/medical.jpg',
            ),
          ),
        ),
      ),
    );
  }
}
