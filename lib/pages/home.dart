import 'package:flutter/material.dart';
import 'package:flutter_application_1/Ui/TV/tv_home.dart';
import 'package:flutter_application_1/Ui/movie/movie_home.dart';

import '../components/nab_bar.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

int _selectedIndex =0;

void navigateBottonBar(int index) {
  setState(() {
    _selectedIndex=index;
  });
}

final List<Widget> _Pages=[
 Movie_Home(),
 Tv_Home()
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Nagibation(
        onTabChange: (index ) =>navigateBottonBar(index),
        ),

      body: _Pages[_selectedIndex],

    );
  }
 
}

