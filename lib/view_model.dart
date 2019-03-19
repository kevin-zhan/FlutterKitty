import 'dart:async';
import 'model.dart';
import 'network_repo.dart';

class KittyListViewModel {
  var _storyListController = StreamController<List<KittyModel>>.broadcast();
  List<KittyModel> kittyList = List();
  var offset = -1;

  Sink get inKittyListController => _storyListController;

  Stream<List<KittyModel>> get outStoryList => _storyListController.stream.map((kitties) {
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
    _storyListController.close();
  }
}