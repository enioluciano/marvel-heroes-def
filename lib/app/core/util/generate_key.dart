import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:project_test/app/core/helpers/environments.dart';

var timeStamp = DateTime.now();
dynamic hash;

String generateUrl(String content, {required String aditional}) {
  generateHash();

  String urlFinal =
      "$content?apikey=${Environments.param('public_key')}&hash=$hash&ts=${timeStamp.toIso8601String()}$aditional";

  return urlFinal;
}

void generateHash() {
  hash = generateMd5(timeStamp.toIso8601String() +
      Environments.param('private_key')! +
      Environments.param('public_key')!);
}

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}
