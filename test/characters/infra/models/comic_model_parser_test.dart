import 'package:flutter_test/flutter_test.dart';
import 'package:project_test/app/pages/characters/infra/models/comic_new_model.dart';

import '../../../util/response_body_comics_api.dart';

void main() {
  final data = response['data']['results'];

  group('comics model parser test', () {
    test('must non null list model', () {
      List list = data.map((e) => ComicNewModel.fromJson(e)).toList();
      expect(list, isNotNull);
      expect(list, isA<List>());
    });

    test('must have none null propriety', () {
      List list = data.map((e) => ComicNewModel.fromJson(e)).toList();
      for (ComicNewModel character in list) {
        expect(character.id, isNotNull);
        expect(character.id, isA<int>());

        expect(character.title, isNotNull);
        expect(character.title, isA<String>());

        expect(character.description, isNotNull);
        expect(character.description, isA<String>());

        expect(character.thumbnail!.path, isNotNull);
        expect(character.thumbnail!.path, isA<String>());

        expect(character.thumbnail!.extension, isNotNull);
        expect(character.thumbnail!.extension, isA<String>());
      }
    });

    test('must have none null propriety', () {
      List list = data.map((e) => ComicNewModel.fromJson(e)).toList();
      for (ComicNewModel character in list) {
        expect(character.id, isNotNull);
        expect(character.id, isA<int>());

        expect(character.title, isNotNull);
        expect(character.title, isA<String>());

        expect(character.description, isNotNull);
        expect(character.description, isA<String>());

        expect(character.thumbnail!.path, isNotNull);
        expect(character.thumbnail!.path, isA<String>());

        expect(character.thumbnail!.extension, isNotNull);
        expect(character.thumbnail!.extension, isA<String>());
      }
    });
  });
}
