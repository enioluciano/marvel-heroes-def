import 'package:project_test/app/pages/characters/domain/entities/comic_new.dart';
import 'package:project_test/app/pages/characters/infra/models/series_model.dart';
import 'package:project_test/app/pages/characters/infra/models/stories_model.dart';
import 'package:project_test/app/pages/characters/infra/models/thumbnail_model.dart';

import 'creators_model.dart';
import 'events_model.dart';

class ComicNewModel extends ComicNew {
  ComicNewModel({
    int? id,
    int? digitalId,
    String? title,
    int? issueNumber,
    String? variantDescription,
    String? description,
    String? modified,
    String? isbn,
    String? upc,
    String? diamondCode,
    String? ean,
    String? issn,
    String? format,
    int? pageCount,
    List<String>? textObjects,
    String? resourceURI,
    List<String>? urls,
    SeriesModel? series,
    List<Null>? variants,
    List<Null>? collections,
    List<Null>? collectedIssues,
    List<String>? dates,
    List<String>? prices,
    ThumbnailModel? thumbnail,
    List<Null>? images,
    CreatorsModel? creators,
    Map<String, dynamic>? characters,
    StoriesModel? stories,
    EventsModel? events,
  }) : super(
            id: id,
            digitalId: digitalId,
            title: title,
            issueNumber: issueNumber,
            variantDescription: variantDescription,
            description: description,
            modified: modified,
            isbn: isbn,
            upc: upc,
            diamondCode: diamondCode,
            ean: ean,
            issn: issn,
            format: format,
            pageCount: pageCount,
            textObjects: textObjects,
            resourceURI: resourceURI,
            urls: urls,
            series: series,
            variants: variants,
            collections: collections,
            collectedIssues: collectedIssues,
            dates: dates,
            prices: prices,
            thumbnail: thumbnail,
            images: images,
            creators: creators,
            characters: characters,
            stories: stories,
            events: events);

  ComicNewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    digitalId = json['digitalId'];
    title = json['title'];
    issueNumber = json['issueNumber'];
    variantDescription = json['variantDescription'] ?? "Sem descrição ";
    description = json['description'] ?? "Sem descrição ";
    modified = json['modified'];
    isbn = json['isbn'];
    upc = json['upc'];
    diamondCode = json['diamondCode'];
    ean = json['ean'];
    issn = json['issn'];
    format = json['format'];
    pageCount = json['pageCount'];

    resourceURI = json['resourceURI'];

    series =
        json['series'] != null ? SeriesModel.fromJson(json['series']) : null;

    thumbnail = json['thumbnail'] != null
        ? ThumbnailModel.fromJson(json['thumbnail'])
        : null;

    creators = json['creators'] != null
        ? CreatorsModel.fromJson(json['creators'])
        : null;
    characters = json['characters'] != null ? json['characters'] : null;
    stories =
        json['stories'] != null ? StoriesModel.fromJson(json['stories']) : null;
    events =
        json['events'] != null ? EventsModel.fromJson(json['events']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['digitalId'] = digitalId;
    data['title'] = title;
    data['issueNumber'] = issueNumber;
    data['variantDescription'] = variantDescription;
    data['description'] = description;
    data['modified'] = modified;
    data['isbn'] = isbn;
    data['upc'] = upc;
    data['diamondCode'] = diamondCode;
    data['ean'] = ean;
    data['issn'] = issn;
    data['format'] = format;
    data['pageCount'] = pageCount;

    data['resourceURI'] = resourceURI;

    if (series != null) {
      data['series'] = series!.toJson();
    }

    if (thumbnail != null) {
      data['thumbnail'] = thumbnail!.toJson();
    }

    if (creators != null) {
      data['creators'] = creators!.toJson();
    }
    if (characters != null) {
      data['characters'] = characters;
    }
    if (stories != null) {
      data['stories'] = stories!.toJson();
    }
    if (events != null) {
      data['events'] = events!.toJson();
    }
    return data;
  }
}
