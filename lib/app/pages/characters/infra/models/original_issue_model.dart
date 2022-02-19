import 'package:project_test/app/pages/characters/domain/entities/original_issue.dart';

class OriginalIssueModel extends OriginalIssue {
  OriginalIssueModel({
    String? resourceURI,
    String? name,
  }) : super(name: name, resourceURI: resourceURI);

  OriginalIssueModel.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resourceURI'] = resourceURI;
    data['name'] = name;
    return data;
  }
}
