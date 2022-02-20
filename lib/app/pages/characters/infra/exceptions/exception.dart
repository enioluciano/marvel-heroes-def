class Conflict implements Exception {
  String? e;
  Conflict({this.e});
}

class GetListCharactersUnauthorizedException implements Exception {
  final String? message;
  GetListCharactersUnauthorizedException([
    this.message,
  ]);
}

class GetListCharactersTimeOutException implements Exception {
  final String? message;
  GetListCharactersTimeOutException([
    this.message,
  ]);
}

class GetListComicsUnauthorizedException implements Exception {
  final String? message;
  GetListComicsUnauthorizedException([
    this.message,
  ]);
}

class GetListComicsTimeOutException implements Exception {
  final String? message;
  GetListComicsTimeOutException([
    this.message,
  ]);
}



// ATUALIZADO

