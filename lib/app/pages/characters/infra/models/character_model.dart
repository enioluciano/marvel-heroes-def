import 'package:project_test/app/pages/characters/domain/entities/character.dart';
import 'package:project_test/app/pages/characters/infra/models/comic_model.dart';
import 'package:project_test/app/pages/characters/infra/models/thumbnail_model.dart';

class CharacterModel extends Character {
  CharacterModel(
      {int? id,
      String? name,
      String? description,
      String? modified,
      ThumbnailModel? thumbnail,
      String? resourceURI,
      ComicModel? comics,
      bool clicked = false})
      : super(
            id: id,
            name: name,
            description: description,
            modified: modified,
            thumbnail: thumbnail,
            resourceURI: resourceURI,
            comics: comics,
            clicked: clicked);

  CharacterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    modified = json['modified'];
    thumbnail = json['thumbnail'] != null
        ? ThumbnailModel.fromJson(json['thumbnail'])
        : null;
    resourceURI = json['resourceURI'];
    comics =
        json['comics'] != null ? ComicModel.fromJson(json['comics']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['modified'] = modified;
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail!.toJson();
    }
    data['resourceURI'] = resourceURI;
    if (comics != null) {
      data['comics'] = comics!.toJson();
    }
    return data;
  }
}
