import 'dart:async';
import 'package:http/http.dart' as http;
import 'model.dart';
import 'dart:convert';

class NetWorkRepo {
  static const String FETCH_KITTY_LIST =
      "https://api.thecatapi.com/v1/images/search?limit=10";

  static Future<List<KittyModel>> requestKittyList() async {
    var response = await http.get(FETCH_KITTY_LIST);
    List<KittyModel> kittyList = List();
    for (var value in jsonDecode(response.body)) {
      kittyList.add(KittyModel.fromJson(value));
    }
    return kittyList;
  }
}
