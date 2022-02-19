import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:project_test/app/core/services/urls.dart';
import 'package:project_test/app/core/util/helper.dart';
import 'package:project_test/app/pages/characters/infra/datasources/characters_datasource.dart';
import 'package:project_test/app/pages/characters/infra/exceptions/exception.dart';

class CharactersDataSourceImpl implements CharactersDataSource {
  Dio dio;
  String server;
  CharactersDataSourceImpl({required this.dio, required this.server});
  @override
  Future<List> getListCharacters(String additional) async {
    List characters = [];
    try {
      String urlFinal = generateUrl(Url.CHARACTERS, aditional: additional);
      final response = await dio.get(urlFinal);
      if (response.statusCode == HttpStatus.notFound) throw NotFound();
      if (response.statusCode == HttpStatus.notAcceptable) {
        throw NotAcceptable();
      }
      if (response.statusCode == HttpStatus.forbidden) throw Forbidden();

      if (response.statusCode == HttpStatus.conflict) throw Conflict();

      if (response.statusCode == HttpStatus.unauthorized) throw Unauthorized();

      characters = response.data['data']['results'];

      return characters;
    } on NotFound {
      rethrow;
    } on NotAcceptable {
      rethrow;
    } on Forbidden {
      rethrow;
    } on Conflict {
      rethrow;
    } on Unauthorized {
      rethrow;
    } catch (e) {
      throw DataSourceError();
    }
  }

  @override
  Future<List> getListComics(int id) async {
    try {
      String urlFinal = generateUrl('${Url.CHARACTERS}/$id/${Url.COMICS}',
          aditional: '&limit=25');
      final response = await dio.get(urlFinal);
      if (response.statusCode == HttpStatus.notFound) throw NotFound();
      if (response.statusCode == HttpStatus.notAcceptable) {
        throw NotAcceptable();
      }
      if (response.statusCode == HttpStatus.forbidden) throw Forbidden();

      if (response.statusCode == HttpStatus.conflict) throw Conflict();

      if (response.statusCode == HttpStatus.unauthorized) throw Unauthorized();

      List characters = response.data['data']['results'];

      return characters;
    } on NotFound {
      rethrow;
    } on NotAcceptable {
      rethrow;
    } on Forbidden {
      rethrow;
    } on Conflict {
      rethrow;
    } on Unauthorized {
      rethrow;
    } catch (e) {
      throw DataSourceError();
    }
  }
}
