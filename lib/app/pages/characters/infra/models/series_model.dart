import 'package:project_test/app/pages/characters/domain/entities/serie.dart';

import 'item_model.dart';

class SeriesModel extends Series {
  SeriesModel({
    int? available,
    String? collectionURI,
    List<ItemModel>? items,
  }) : super(available: available, collectionURI: collectionURI, items: items);

  SeriesModel.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items!.add(ItemModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['available'] = available;
    data['collectionURI'] = collectionURI;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
