import 'package:project_test/app/pages/characters/infra/models/item_model.dart';

class Comic {
  int? available;
  String? collectionURI;
  List<ItemModel>? items;
  int? returned;

  Comic({this.available, this.collectionURI, this.items, this.returned});
}
