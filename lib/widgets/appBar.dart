import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:netflix_demo/constants/style.dart';

PreferredSize appBar(context, {String? title}) => PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, 50),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.menu,
                  color: iconColor,
                  size: 35,
                ),
                Center(
                  child: SizedBox(
                    height: 40,
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 25,
                )
              ],
            ),
          )),
        ),
      ),
    );
