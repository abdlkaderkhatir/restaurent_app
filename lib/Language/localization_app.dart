

import 'package:get/get.dart';
import 'package:restaurant_app/Language/ar.dart';
import 'package:restaurant_app/Language/en.dart';
import 'package:restaurant_app/Language/fr.dart';
import 'package:restaurant_app/utils/my_string.dart';

class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
        frf: fr,
      };
}