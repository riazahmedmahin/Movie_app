import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Nagibation extends StatelessWidget {
  void Function(int)? onTabChange;
  Nagibation({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
         child: GNav(
          onTabChange: (value) => onTabChange!(value),
        color: Colors.black,
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.black,
        tabBorderRadius: 24,
        tabActiveBorder:Border.all(color: Colors.black),
        tabs: [
      GButton(icon: Icons.movie,
      text: "Movie",),
      
      GButton(icon: Icons.tv,
      text: "TV",),

      ]
      ),
  
    );
  }
}