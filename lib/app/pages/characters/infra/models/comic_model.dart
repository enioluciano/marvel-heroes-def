import 'package:project_test/app/pages/characters/domain/entities/comic.dart';

import 'item_model.dart';

class ComicModel extends Comic {
  ComicModel({
    int? available,
    String? collectionURI,
    List<ItemModel>? items,
    int? returned,
  }) : super(
            available: available,
            collectionURI: collectionURI,
            items: items,
            returned: returned);

  ComicModel.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items!.add(ItemModel.fromJson(v));
      });
    }
    returned = json['returned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['available'] = available;
    data['collectionURI'] = collectionURI;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['returned'] = returned;
    return data;
  }
}
