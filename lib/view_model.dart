import 'dart:async';
import 'model.dart';
import 'network_repo.dart';

class KittyListViewModel {
  var _kittyListController = StreamController<List<KittyModel>>.broadcast();
  List<KittyModel> kittyList = List();
  var offset = -1;

  Sink get inKittyListController => _kittyListController;

  Stream<List<KittyModel>> get outStoryList =>
      _kittyListController.stream.map((kitties) {
        kittyList.addAll(kitties);
        return kittyList;
      });

  refreshKittyList() async {
    kittyList.clear();
    List<KittyModel> list = await NetWorkRepo.requestKittyList();
    inKittyListController.add(list);
  }

  loadNextPage() async {
    List<KittyModel> list = await NetWorkRepo.requestKittyList();
    inKittyListController.add(list);
  }

  depose() {
    _kittyListController.close();
  }
}

class CategoryKittyListViewModel {

  var category = 1;
  var _kittyListController = StreamController<List<KittyModel>>.broadcast();
  List<KittyModel> kittyList = List();
  var offset = -1;

  setCategory(int category) {
    this.category = category;
  }

  Sink get inKittyListController => _kittyListController;

  Stream<List<KittyModel>> get outStoryList =>
      _kittyListController.stream.map((kitties) {
        kittyList.addAll(kitties);
        return kittyList;
      });

  loadNextPage() async {
    List<KittyModel> list = await NetWorkRepo.requestKittyListWithCategory(category);
    inKittyListController.add(list);
  }

  depose() {
    _kittyListController.close();
  }
}
