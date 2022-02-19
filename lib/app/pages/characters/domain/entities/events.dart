import 'package:project_test/app/pages/characters/infra/models/item_model.dart';

class Events {
  int? available;
  String? collectionURI;
  List<ItemModel>? items;
  int? returned;

  Events({this.available, this.collectionURI, this.items, this.returned});
}
