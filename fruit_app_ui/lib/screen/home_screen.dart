import 'package:flutter/material.dart';
import 'package:fruit_app_ui/widget/categories.dart';
import 'package:fruit_app_ui/widget/new_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text("All Fruits",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold
            ),),
          ),

          Categories(),
          NewItems(),
        ],
      ),
    );
  }
}
