import 'package:flutter_kitty/model.dart';
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
          child: Text("Tap to load more..."),
        )));
  }

  static Widget buildCategoryRow(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 8.0, 0, 8),
          child: Text(
            "Category",
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 2.0, 10, 2),
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
                    "Space", "assets/space_bg.jpg", () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => CategoryKittyPage(
                                title: "Space",
                                category: 2,
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
                CustomizeWidget.buildCategoryWidget(
                    "Sunglasses", "assets/sunglasses_bg.jpg", () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => CategoryKittyPage(
                            title: "Sunglasses",
                            category: 4,
                          )));
                }),
                CustomizeWidget.buildCategoryWidget(
                    "Ties", "assets/tie_bg.jpg", () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => CategoryKittyPage(
                            title: "Ties",
                            category: 7,
                          )));
                }),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 8.0, 0, 8),
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
          height: 140,
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
