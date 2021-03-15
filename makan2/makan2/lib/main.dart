import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

import 'widgets.dart';
import 'HomePage.dart';
import 'Inventory.dart';
import 'Favorites.dart';
import 'ShoppingList.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Recommendations',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      darkTheme: ThemeData.dark(),
      builder: (context, child) {
        return CupertinoTheme (
          data: CupertinoThemeData(),
          child: Material(child:child),
        );
      },
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  // list of widget to render based on current selected tab
  // Consider if Favorites Tab needs a final GlobalKey(); refer example
  Widget _buildAndroidHomePage(BuildContext context) {
    return HomePage(
      androidDrawer: _AndroidDrawer(),
    );
  }

  Widget _buildIosHomePage(BuildContext context) {
    return CupertinoTabScaffold (
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: HomePage.iosIcon,
            label: HomePage.title,
          ),
          BottomNavigationBarItem(
            icon: Inventory.iosIcon,
            label: Inventory.title,
          ),
          BottomNavigationBarItem(
            icon: Favorites.iosIcon,
            label: Favorites.title,
          ),
          BottomNavigationBarItem(
            icon: ShoppingList.iosIcon,
            label: ShoppingList.title,
          )
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0: 
            return CupertinoTabView (
              defaultTitle: HomePage.title,
              builder: (context) => HomePage(),
           );
          case 1:
            return CupertinoTabView (
              defaultTitle: Inventory.title,
              builder: (context) => Inventory(),
            );
          case 2:
            return CupertinoTabView (
              defaultTitle: Favorites.title,
              builder: (context) => Favorites(),
            );
          case 3: 
            return CupertinoTabView (
              defaultTitle: ShoppingList.title,
              builder: (context) => ShoppingList(),
            );
          default:
            assert(false, 'Unexpected tab');
            return null;
        }
      },
    );
  }

  @override
  Widget build(context) {
    return PlatformWidget (
      androidBuilder: _buildAndroidHomePage,
      iosBuilder: _buildIosHomePage,
    );
  }
}

class _AndroidDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer (
      child: Column (
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader (
            decoration: BoxDecoration(color: Colors.green),
            child: Padding (
              padding: const EdgeInsets.only(bottom:20),
              child: Icon (
                Icons.account_circle,
                color: Colors.green.shade800,
                size: 96,
              ),
            ),
          ),
          ListTile (
            leading: HomePage.androidIcon,
            title: Text(HomePage.title),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile (
            leading: Inventory.androidIcon,
            title: Text(Inventory.title),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(
                context, MaterialPageRoute(builder: (context) => Inventory())
              );
            },
          ),
          ListTile (
            leading: Favorites.androidIcon,
            title: Text(Favorites.title),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void> (
                context, MaterialPageRoute(builder: (context) => Favorites())
              );
            },
          ),
          //ListTile (
            //leading: ShoppingList.androidIcon,
            //title: Text(ShoppingList.title),
            //onTap: () {
              //Navigator.pop(context);
              //Navigator.push<void> (
                //context, MaterialPageRoute(builder: (context) => ShoppingList())
              //);
            //},
          //),
        ],
        ),
    );
  }
}
  

