import 'package:final_project/modules/cart/cart_screen.dart';

import 'package:final_project/modules/category/categories_screen.dart';
import 'package:final_project/modules/home/home_screen.dart';

import 'package:flutter/material.dart';

class bottomNav extends StatefulWidget {
  @override
  _bottomNavState createState() => _bottomNavState();
}

class _bottomNavState extends State<bottomNav> {
  int current = 0;
  List<Widget> list = [
    Home(),
    categories(),
    cart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[current],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: current == 0 ? Colors.red : Colors.black,
            ),
            title: Text(
              "Home",
              style: TextStyle(
                color: current == 0 ? Colors.red : Colors.black,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
              color: current == 1 ? Colors.red : Colors.black,
            ),
            title: Text(
              "Category",
              style: TextStyle(
                color: current == 1 ? Colors.red : Colors.black,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: current == 2 ? Colors.red : Colors.black,
            ),
            title: Text(
              "cart",
              style: TextStyle(
                color: current == 2 ? Colors.red : Colors.black,
              ),
            ),
          ),
        ],
        onTap: onpress,
      ),
    );
  }

  void onpress(int index) {
    setState(() {
      current = index;
    });
  }
}
