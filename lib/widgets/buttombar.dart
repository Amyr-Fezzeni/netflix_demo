import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:netflix_demo/constants/style.dart';

class CustomButtomBar extends StatelessWidget {
  const CustomButtomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: const Icon(
                    Icons.home_filled,
                    color: iconColor,
                    size: 35,
                  ),
                ),
                const Icon(
                  Icons.search,
                  color: iconColor,
                  size: 35,
                ),
                const Icon(
                  Icons.local_fire_department,
                  color: iconColor,
                  size: 35,
                ),
                const Icon(
                  Icons.favorite,
                  color: iconColor,
                  size: 35,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
