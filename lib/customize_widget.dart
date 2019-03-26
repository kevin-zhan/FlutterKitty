import 'package:daily_zhihu/model.dart';
import 'package:flutter/material.dart';
import 'pages.dart';

class CustomizeWidget {
  static Widget buildRow(KittyModel kitty) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
      child: GestureDetector(
        onTap: () {
          print(kitty.url);
        },
        child: FadeInImage.assetNetwork(
          placeholder: "assets/default_holder.jpeg",
          image: kitty.url,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  static Widget buildLoadMoreView(GestureTapCallback tapCallback) {
    return GestureDetector(
        onTap: tapCallback, child: Center(child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text("加载中..."),
        )));
  }

  static Widget buildCategoryRow(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Category",
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: <Widget>[
                CustomizeWidget.buildCategoryWidget(
                    "Boxes", "assets/box_bg.jpg", () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => CategoryKittyPage(
                                title: "Boxes",
                                category: 5,
                              )));
                }),
                CustomizeWidget.buildCategoryWidget("Hats", "assets/hat_bg.png",
                    () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => CategoryKittyPage(
                                title: "Hats",
                                category: 1,
                              )));
                }),
                CustomizeWidget.buildCategoryWidget(
                    "Clothes", "assets/clothes_bg.jpg", () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => CategoryKittyPage(
                                title: "Clothes",
                                category: 15,
                              )));
                }),
                CustomizeWidget.buildCategoryWidget(
                    "Sinks", "assets/sinks_bg.jpg", () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => CategoryKittyPage(
                                title: "Sinks",
                                category: 14,
                              )));
                }),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Popular",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500)),
        )
      ],
    );
  }

  static Widget buildCategoryWidget(
      String categoryName, String bgName, GestureTapCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.grey,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: 130,
          width: 300,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset(
                bgName,
                fit: BoxFit.fitWidth,
              ),
              Container(
                color: Color.fromARGB(101, 0, 0, 0),
              ),
              Center(
                child: Text(
                  categoryName,
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
