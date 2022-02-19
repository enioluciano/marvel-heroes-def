import 'package:project_test/app/pages/characters/domain/entities/thumbnail.dart';

class ThumbnailModel extends Thumbnail {
  ThumbnailModel({
    String? path,
    String? extension,
  }) : super(extension: extension, path: path);

  ThumbnailModel.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['path'] = path;
    data['extension'] = extension;
    return data;
  }
}
