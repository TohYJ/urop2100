import 'package:flutter/material.dart';
import 'package:makan2/HomePage.dart';
import 'package:makan2/Inventory.dart';
import 'package:makan2/AddRecipes.dart';
import 'package:makan2/ShoppingList.dart';
import 'package:makan2/Favorites.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  // list of widget to render based on current selected tab
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    Inventory(),
    Favorites(),
    ShoppingList(),
    AddRecipes(),
  ];
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Makan Makan'),
        ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: [ // dynamic creation of buttons?
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shopping List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Inventory',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Recipes',
          ),
        ],
      ),
    );
  }
  
  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}