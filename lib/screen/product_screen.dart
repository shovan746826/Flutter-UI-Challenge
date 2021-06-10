import 'package:flutter/material.dart';
import 'package:fruit_app_ui/model/list_item.dart';

class ProductScreen extends StatelessWidget {
  final ListItem item;

  ProductScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(int.parse(item.color)),
      ),
      home: Scaffold(
        backgroundColor: Color(int.parse(item.color)),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Colors.white,
              onPressed: () {},
            )
          ],
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height < 600
                ? null
                : MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom -
                    56,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  // height: 550,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: Text(
                          item.name,
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Center(
                        child: Hero(
                          tag: item.name,
                          child: Image(
                            height: 300.0,
                            width: 300.0,
                            image: AssetImage("assets/images/${item.image}"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        child: Text(
                          "Description",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        child: Text(
                          item.longDescription,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60.0,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 15.0,
                        left: 20.0,
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: item.price + ".00 ",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: "(${item.kg})",
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                          ]),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 60.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  bottomLeft: Radius.circular(20.0))),
                          child: Center(
                            child: Text("By Now",
                            style: TextStyle(
                              color: Color(int.parse(item.color)),
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
