import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:project_test/app/core/util/urls.dart';

class Helper {
  static String publicApiKey = "201792b9215ebe22fb64253fa1d88b80";
  static String privateApiKey = "680b0a2d843973551a6519c530981f9e8d2f38f5";
}

var timeStamp = DateTime.now();
dynamic hash;

String generateUrl(String content, {required String aditional}) {
  generateHash();
  String urlFinal =
      "${Url.SERVER}$content?apikey=${Helper.publicApiKey}&hash=$hash&ts=${timeStamp.toIso8601String()}$aditional";

  return urlFinal;
}

void generateHash() {
  hash = generateMd5(
      timeStamp.toIso8601String() + Helper.privateApiKey + Helper.publicApiKey);
}

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}
