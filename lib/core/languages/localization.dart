import '../utils/basic_import.dart';
import 'english.dart';
import 'france.dart';


class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': english,
    'fr_FR': french,
  };
}

/*

I will provide you a Strings class that contains all static text used in my app.
Your task is to generate language-specific maps for translations.
For each language I mention (e.g., English, French), create a Map<String, String> where the keys are the Strings class constants and the values are the translated text.
Keep the structure like:

Map<String, String> english = {
  Strings.error: "Error",
  Strings.enter: "Enter",
  ...
};

Map<String, String> french = {
  Strings.error: "Erreur",
  Strings.enter: "Entrer",
  ...
};

Do this for all provided Strings in the class.

Here is my Strings class:


 */
