import 'package:daily_zhihu/customize_widget.dart';
import 'package:flutter/material.dart';
import 'model.dart';
import 'view_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterKitty',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MyHomePage(title: 'FlutterKitty'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  KittyListViewModel kittyListViewModel = KittyListViewModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 400.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("Flutter Kitty",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        )),
                    background: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.asset(
                          "assets/default_holder.jpeg",
                          fit: BoxFit.cover,
                        ),
                        Container(
                          color: Color.fromARGB(40, 0, 0, 0),
                        ),
                      ],
                    )),
              ),
            ];
          },
          body: StreamBuilder<List<KittyModel>>(
              stream: kittyListViewModel.outStoryList,
              builder: (context, snapshot) {
                List kitties = snapshot.data;
                return ListView.builder(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    itemCount: (kitties?.length ?? 0) + 2,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return CustomizeWidget.buildCategoryRow(context);
                      }

                      if (kitties == null || index > kitties.length) {
                        kittyListViewModel.loadNextPage();
                        return CustomizeWidget.buildLoadMoreView(() {
                          kittyListViewModel.loadNextPage();
                        });
                      }
                      return CustomizeWidget.buildRow(kitties[index - 1]);
                    });
              })),
    );
  }
}
