import 'package:project_test/app/pages/characters/infra/models/comic_model.dart';
import 'package:project_test/app/pages/characters/infra/models/thumbnail_model.dart';

class Character {
  int? id;
  String? name;
  String? description;
  String? modified;
  ThumbnailModel? thumbnail;
  String? resourceURI;
  ComicModel? comics;
  bool? clicked = false;

  Character(
      {this.id,
      this.name,
      this.description,
      this.modified,
      this.thumbnail,
      this.resourceURI,
      this.comics,
      this.clicked});
}
