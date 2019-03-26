import 'dart:async';
import 'package:http/http.dart' as http;
import 'model.dart';
import 'dart:convert';

class NetWorkRepo {
  static const String FETCH_KITTY_LIST =
      "https://api.thecatapi.com/v1/images/search?";
  static const String SIZE_LIMIT = "limit=10";
  static const String CATEGORY_ID = "category_ids=";

  static Future<List<KittyModel>> requestKittyList() async {
    var url = FETCH_KITTY_LIST + SIZE_LIMIT;
    var response = await http.get(url, headers: {"x-api-key": "DEMO-API-KEY"});
    List<KittyModel> kittyList = List();
    for (var value in jsonDecode(response.body)) {
      kittyList.add(KittyModel.fromJson(value));
    }
    return kittyList;
  }

  static Future<List<KittyModel>> requestKittyListWithCategory(
      int category) async {
    var url =
        FETCH_KITTY_LIST + CATEGORY_ID + category.toString() + "&" + SIZE_LIMIT;
    var response = await http.get(url, headers: {"x-api-key": "DEMO-API-KEY"});
    List<KittyModel> kittyList = List();
    for (var value in jsonDecode(response.body)) {
      kittyList.add(KittyModel.fromJson(value));
    }
    return kittyList;
  }
}
