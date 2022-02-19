import 'package:project_test/app/pages/characters/infra/models/item_model.dart';

class Series {
  int? available;
  String? collectionURI;
  List<ItemModel>? items;

  Series({this.available, this.collectionURI, this.items});
}
