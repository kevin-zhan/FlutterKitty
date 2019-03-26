import 'package:daily_zhihu/customize_widget.dart';
import 'package:flutter/material.dart';
import 'model.dart';
import 'view_model.dart';

class CategoryKittyPage extends StatefulWidget {
  CategoryKittyPage({Key key, this.title, this.category}) : super(key: key);
  final String title;
  final int category;

  @override
  _CategoryKittyPageState createState() => _CategoryKittyPageState();
}

class _CategoryKittyPageState extends State<CategoryKittyPage> {
  CategoryKittyListViewModel kittyListViewModel = CategoryKittyListViewModel();
  var isSending = false;

  @override
  Widget build(BuildContext context) {
    kittyListViewModel.setCategory(widget.category);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<List<KittyModel>>(
          stream: kittyListViewModel.outStoryList,
          builder: (context, snapshot) {
            List kitties = snapshot.data;
            return ListView.builder(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                itemCount: (kitties?.length ?? 0) + 1,
                itemBuilder: (context, index) {
                  if (kitties == null || index > kitties.length - 1) {
                    if (!isSending) {
                      isSending = true;
                      kittyListViewModel.loadNextPage().then((void v) {
                        isSending = false;
                      });
                    }
                    return CustomizeWidget.buildLoadMoreView(() {
                      kittyListViewModel.loadNextPage();
                    });
                  }
                  return CustomizeWidget.buildRow(kitties[index]);
                });
          }),
    );
  }
}
