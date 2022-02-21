class GetListCharactersUnauthorizedException implements Exception {
  final String? message;
  GetListCharactersUnauthorizedException([
    this.message,
  ]);
}

class GetListCharactersForbiddenException implements Exception {
  final String? message;
  GetListCharactersForbiddenException([
    this.message,
  ]);
}

class GetListCharactersTimeOutException implements Exception {
  final String? message;
  GetListCharactersTimeOutException([
    this.message,
  ]);
}

// ** EXCEPTIONS COMICS

class GetListComicsUnauthorizedException implements Exception {
  final String? message;
  GetListComicsUnauthorizedException([
    this.message,
  ]);
}

class GetListComicsForbiddenException implements Exception {
  final String? message;
  GetListComicsForbiddenException([
    this.message,
  ]);
}

class GetListComicsTimeOutException implements Exception {
  final String? message;
  GetListComicsTimeOutException([
    this.message,
  ]);
}
