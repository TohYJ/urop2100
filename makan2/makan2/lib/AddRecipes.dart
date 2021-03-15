import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'widgets.dart';

class InputRecipe extends StatefulWidget {
  InputRecipe({Key key}) : super(key: key);
  @override
  _InputRecipeState createState() => _InputRecipeState();
}

class _InputRecipeState extends State<InputRecipe> {
  final _formKey = GlobalKey<FormState>();
  final recipeController = TextEditingController();
  final timeController = TextEditingController();
  final ingredientsController = TextEditingController();
  final dbRef = FirebaseDatabase.instance.reference().child("recipes");

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, // what does this do?
      child: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextFormField(
              controller: recipeController,
              decoration: InputDecoration(
              labelText: "Enter Recipe Name",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter Recipe Name';
              }
              return null;
            },
            )
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextFormField(
              controller: timeController,
              decoration: InputDecoration(
              labelText: "Enter Recipe Time (minutes)",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter Recipe Time (minutes)';
              }
              return null;
            },
            )
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextFormField(
              controller: ingredientsController,
              decoration: InputDecoration(
              labelText: "Enter Ingredients",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter Ingredients';
              }
              return null;
            },
            )
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: IconButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  dbRef.push().set({
                    "recipe" : recipeController.text,
                    "time" : timeController.text,
                    "ingredients" : ingredientsController.text,
                  }).then((_){
                    Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Successfully Added'))
                    );
                    recipeController.clear();
                    timeController.clear();
                    ingredientsController.clear();
                  }).catchError((onError) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text(onError))
                    );
                  });
                }
              },
              icon: Icon(Icons.add),
            ),
          )
        ],),
      )
    );
  }
}


class AddRecipes extends StatefulWidget {
  static const title = 'Add Recipes';
  static const androidIcon = Icon(Icons.add);
  static const iosIcon = Icon(CupertinoIcons.add);
  @override
  _AddRecipesState createState() => _AddRecipesState();
}

class _AddRecipesState extends State<AddRecipes> {

  bool initialized = false;
  bool error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        initialized = true;
      });
    } catch(e) {
      setState(() {
        error = true;
      });
    }
  }

  Widget _randomBuild(BuildContext context, int index) {
    return SafeArea(
      child: InkWell(
        child: Text('This is Add Recipes Page!'),
      )
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold (
      appBar: AppBar (
        title: Text(AddRecipes.title),
      ),
      body: Center (
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("Please Enter Your Favourite Recipe ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Roboto',
                  ),
                ), 
              ),
              InputRecipe(),
            ]
          ),
        )
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold (
      navigationBar: CupertinoNavigationBar(),
      child: ListView.builder(
        itemBuilder: _randomBuild,
      ),
    );
  }

  @override
  Widget build(context) {
    return PlatformWidget (
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}


