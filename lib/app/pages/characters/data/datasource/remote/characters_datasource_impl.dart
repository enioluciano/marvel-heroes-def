import 'package:dio/dio.dart';
import 'package:project_test/app/core/helpers/logger.dart';
import 'package:project_test/app/core/rest_client/rest_client.dart';
import 'package:project_test/app/core/rest_client/rest_client_excpetion.dart';
import 'package:project_test/app/core/util/urls.dart';
import 'package:project_test/app/core/util/helper.dart';
import 'package:project_test/app/pages/characters/infra/datasources/characters_datasource.dart';
import 'package:project_test/app/pages/characters/infra/exceptions/exception.dart';
import 'package:project_test/app/pages/characters/infra/exceptions/failure.dart';

class CharactersDataSourceImpl implements CharactersDataSource {
  final RestClient _restClient;
  final Logger _log;

  CharactersDataSourceImpl(
      {required RestClient restClient, required Logger log})
      : _restClient = restClient,
        _log = log;
  @override
  Future<List> getListCharacters(String additional) async {
    List characters = [];
    try {
      String urlFinal = generateUrl(Url.CHARACTERS, aditional: additional);

      final response = await _restClient.get(urlFinal);

      characters = response.data['data']['results'];

      return characters;
    } on RestClientException catch (err, stackTrace) {
      if (err.error == 'Connecting timed out [60ms]') {
        _log.error(
            'SessionDatasource - getListCharacters - TimeOut => Conexão não estabelecida! ',
            err,
            stackTrace);

        throw GetListCharactersTimeOutException();
      }

      if (err.statusCode == 403) {
        _log.error(
            'SessionDatasource - getListCharacters - Forbidden, código:${err.statusCode} => Servidor se recusa a autorizar ',
            err,
            stackTrace);
        throw GetListCharactersForbiddenException();
      }

      if (err.statusCode == 401) {
        _log.error(
            'SessionDatasource - getListCharacters - Unauthorized ${err.statusCode}',
            err,
            stackTrace);
        throw GetListCharactersUnauthorizedException();
      }
      _log.error(
          'SessionDatasource - getListCharacters - Erro Desconhecido ${err.statusCode}',
          err,
          stackTrace);

      throw Failure();
    }
  }

  @override
  Future<List> getListComics(int id) async {
    try {
      String urlFinal = generateUrl('${Url.CHARACTERS}/$id/${Url.COMICS}',
          aditional: '&limit=25');
      final response = await _restClient.get(urlFinal);

      List characters = response.data['data']['results'];

      return characters;
    } on RestClientException catch (err, stackTrace) {
      if (err.error == 'Connecting timed out [60ms]') {
        _log.error(
            'SessionDatasource - getListComics - TimeOut => Conexão não estabelecida! ',
            err,
            stackTrace);
        throw GetListComicsTimeOutException();
      }

      if (err.statusCode == 403) {
        _log.error(
            'SessionDatasource - getListComics - Forbidden, código:${err.statusCode} => Servidor se recusa a autorizar ',
            err,
            stackTrace);
        throw GetListComicsUnauthorizedException();
      }

      if (err.statusCode == 401) {
        _log.error(
            'SessionDatasource - getListComics - Unauthorized ${err.statusCode}',
            err,
            stackTrace);
        throw GetListComicsUnauthorizedException();
      }
      _log.error(
          'SessionDatasource - getListComics - Erro Desconhecido ${err.statusCode}',
          err,
          stackTrace);

      throw Failure();
    }
  }
}
