class NotFound implements Exception {}

class Forbidden implements Exception {}

class NotAcceptable implements Exception {}

class Conflict implements Exception {
  String? e;
  Conflict({this.e});
}

class Unauthorized implements Exception {}

class DataSourceError implements Exception {}
