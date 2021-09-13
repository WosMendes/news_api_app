import 'package:get/get.dart';

class LanguageController extends GetxController {
  var language = 'us'.obs;
  var appTitle = 'Main News'.obs;

  changeLanguage() {
    if (language.value == 'us') {
      language.value = 'br';
      appTitle.value = 'Principais Notícias';
    } else {
      language.value = 'us';
      appTitle.value = 'Main News';
    }
  }
}
