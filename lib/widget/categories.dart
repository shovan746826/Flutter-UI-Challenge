import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fruit_app_ui/model/list_item.dart';
import 'package:fruit_app_ui/screen/product_screen.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int _selectedIndex = 0;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    this._scrollController.addListener(() {
      _selectCategoryIndex();
    });
    super.initState();
  }

  _selectCategoryIndex() {
    Timer(Duration(milliseconds: 400), () {
      var newIndex = _scrollController.offset / 210;
      if (newIndex.round() != _selectedIndex) {
        setState(() {
          _selectedIndex = newIndex.round();
        });
      }
    });
  }

  _scrollToItem(index) {
    double position = index * 220.0; //must be set double value (220.0)
    _scrollController.animateTo(position,
        duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _listCategories(),
        _showFruit(),
      ],
    );
  }

  Widget _listCategories() {
    return Container(
      height: 45.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listItems.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
                _scrollToItem(_selectedIndex);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                        style: _selectedIndex == index
                            ? BorderStyle.solid
                            : BorderStyle.none,
                      ),
                    ),
                  ),
                  margin: EdgeInsets.only(right: 10.0),
                  child: Text(
                    listItems[index].name,
                    style: TextStyle(
                      color:
                          _selectedIndex == index ? Colors.black : Colors.grey,
                      fontSize: 16.0,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget _showFruit() {
    return Container(
      height: 380.0,
      margin: EdgeInsets.only(top: 20.0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listItems.length,
          controller: _scrollController,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
              width: 220.0,
              decoration: BoxDecoration(
                  color: Color(int.parse(listItems[index].color)),
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10.0,
                      offset: Offset(0, 30),
                      color: Color(int.parse(listItems[index].color))
                          .withOpacity(0.6),
                      spreadRadius: -20.0,
                    )
                  ]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          listItems[index].name,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: listItems[index].price + ".00",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: " (${listItems[index].kg})",
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Hero(
                    tag: listItems[index].name,
                    child: Image(
                      image:
                          AssetImage("assets/images/${listItems[index].image}"),
                      height: 150,
                      width: 150,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10.0),
                    child: Text(
                      listItems[index].description,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10.0,
                  ),

                  // ignore: deprecated_member_use
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.black.withOpacity(0.1),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Add to cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductScreen(item: listItems[index])),
                      );
                    },
                  ),
                ],
              ),
            );
          }),
    );
  }
}
