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
        primarySwatch: Colors.blue,
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
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: StreamBuilder<List<KittyModel>>(
            stream: kittyListViewModel.outStoryList,
            builder: (context, snapshot) {
              List kitties = snapshot.data;
              return RefreshIndicator(
                onRefresh: () {
                  return kittyListViewModel.refreshKittyList();
                },
                child: ListView.builder(
                    itemCount: (kitties?.length ?? 0) + 1,
                    itemBuilder: (context, index) {
                      if (index >= (kitties?.length ?? 0)) {
                        kittyListViewModel.loadNextPage();
                        return _buildLoadMoreView();
                      }
                      return _buildRow(kitties[index]);
                    }),
              );
            }));
  }

  Widget _buildRow(KittyModel kitty) {
    return Card(
      child: Image.network(
        kitty.url,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _buildLoadMoreView() {
    return Center(child: Text("加载中..."));
  }
}