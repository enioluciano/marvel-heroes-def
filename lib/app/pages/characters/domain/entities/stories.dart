import 'package:project_test/app/pages/characters/infra/models/character_model.dart';
import 'package:project_test/app/pages/characters/infra/models/comic_model.dart';
import 'package:project_test/app/pages/characters/infra/models/creators_model.dart';
import 'package:project_test/app/pages/characters/infra/models/events_model.dart';
import 'package:project_test/app/pages/characters/infra/models/original_issue_model.dart';
import 'package:project_test/app/pages/characters/infra/models/series_model.dart';
import 'package:project_test/app/pages/characters/infra/models/thumbnail_model.dart';

class Stories {
  int? id;
  String? title;
  String? description;
  String? resourceURI;
  String? type;
  String? modified;
  ThumbnailModel? thumbnail;
  CreatorsModel? creators;
  CharacterModel? character;
  SeriesModel? series;
  ComicModel? comics;
  EventsModel? events;
  OriginalIssueModel? originalIssue;

  Stories(
      {this.id,
      this.title,
      this.description,
      this.resourceURI,
      this.type,
      this.modified,
      this.thumbnail,
      this.creators,
      this.character,
      this.series,
      this.comics,
      this.events,
      this.originalIssue});
}
