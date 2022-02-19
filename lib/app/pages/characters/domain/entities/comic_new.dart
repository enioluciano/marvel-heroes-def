import 'package:project_test/app/pages/characters/infra/models/creators_model.dart';
import 'package:project_test/app/pages/characters/infra/models/events_model.dart';
import 'package:project_test/app/pages/characters/infra/models/series_model.dart';
import 'package:project_test/app/pages/characters/infra/models/stories_model.dart';
import 'package:project_test/app/pages/characters/infra/models/thumbnail_model.dart';

class ComicNew {
  int? id;
  int? digitalId;
  String? title;
  int? issueNumber;
  String? variantDescription;
  String? description;
  String? modified;
  String? isbn;
  String? upc;
  String? diamondCode;
  String? ean;
  String? issn;
  String? format;
  int? pageCount;
  List<String>? textObjects;
  String? resourceURI;
  List<String>? urls;
  SeriesModel? series;
  List<Null>? variants;
  List<Null>? collections;
  List<Null>? collectedIssues;
  List<String>? dates;
  List<String>? prices;
  ThumbnailModel? thumbnail;
  List<Null>? images;
  CreatorsModel? creators;
  Map<String, dynamic>? characters;
  StoriesModel? stories;
  EventsModel? events;

  ComicNew(
      {this.id,
      this.digitalId,
      this.title,
      this.issueNumber,
      this.variantDescription,
      this.description,
      this.modified,
      this.isbn,
      this.upc,
      this.diamondCode,
      this.ean,
      this.issn,
      this.format,
      this.pageCount,
      this.textObjects,
      this.resourceURI,
      this.urls,
      this.series,
      this.variants,
      this.collections,
      this.collectedIssues,
      this.dates,
      this.prices,
      this.thumbnail,
      this.images,
      this.creators,
      this.characters,
      this.stories,
      this.events});
}
