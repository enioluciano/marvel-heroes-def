import 'package:project_test/app/pages/characters/domain/entities/stories.dart';
import 'package:project_test/app/pages/characters/infra/models/series_model.dart';
import 'package:project_test/app/pages/characters/infra/models/thumbnail_model.dart';

import 'character_model.dart';
import 'comic_model.dart';
import 'creators_model.dart';
import 'events_model.dart';
import 'original_issue_model.dart';

class StoriesModel extends Stories {
  StoriesModel({
    int? id,
    String? title,
    String? description,
    String? resourceURI,
    String? type,
    String? modified,
    ThumbnailModel? thumbnail,
    CreatorsModel? creators,
    CharacterModel? character,
    SeriesModel? series,
    ComicModel? comics,
    EventsModel? events,
    OriginalIssueModel? originalIssue,
  }) : super(
            id: id,
            title: title,
            description: description,
            resourceURI: resourceURI,
            type: type,
            modified: modified,
            thumbnail: thumbnail,
            character: character,
            comics: comics,
            creators: creators,
            series: series,
            events: events,
            originalIssue: originalIssue);

  StoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    resourceURI = json['resourceURI'];
    type = json['type'];
    modified = json['modified'];
    thumbnail = json['thumbnail'] != null
        ? ThumbnailModel.fromJson(json['thumbnail'])
        : null;
    creators = json['creators'] != null
        ? CreatorsModel.fromJson(json['creators'])
        : null;
    character = json['personagem'] != null
        ? CharacterModel.fromJson(json['personagem'])
        : null;
    series =
        json['series'] != null ? SeriesModel.fromJson(json['series']) : null;
    comics =
        json['comics'] != null ? ComicModel.fromJson(json['comics']) : null;
    events =
        json['events'] != null ? EventsModel.fromJson(json['events']) : null;
    originalIssue = json['originalIssue'] != null
        ? OriginalIssueModel.fromJson(json['originalIssue'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['resourceURI'] = resourceURI;
    data['type'] = type;
    data['modified'] = modified;
    data['thumbnail'] = thumbnail;
    if (creators != null) {
      data['creators'] = creators!.toJson();
    }
    if (character != null) {
      data['personagem'] = character!.toJson();
    }
    if (series != null) {
      data['series'] = series!.toJson();
    }
    if (comics != null) {
      data['comics'] = comics!.toJson();
    }
    if (events != null) {
      data['events'] = events!.toJson();
    }
    if (originalIssue != null) {
      data['originalIssue'] = originalIssue!.toJson();
    }
    return data;
  }
}
