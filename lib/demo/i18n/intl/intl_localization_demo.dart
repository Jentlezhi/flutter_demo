import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'localization_demo_messages_all.dart';
import 'package:intl/intl.dart';

class IntlDemoLocalizations {
  static IntlDemoLocalizations of(BuildContext context) {
    return Localizations.of<IntlDemoLocalizations>(
        context, IntlDemoLocalizations);
  }

  static Future<IntlDemoLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return IntlDemoLocalizations();
    });
  }

  String get title => Intl.message(
        'hello',
        name: 'title',
        desc: 'demo localizations.',
      );

  String greet(String name) => Intl.message(
        'hello$name',
        name: 'greet',
        desc: 'greet someone.',
        args: [name],
      );
}


class LocalizationDemoDelegate extends LocalizationsDelegate<IntlDemoLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  Future<IntlDemoLocalizations> load(Locale locale) {
    return IntlDemoLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<IntlDemoLocalizations> old) {
    return false;
  }
}

/*
flutter pub pub run intl_translation:generate_from_arb --generated-file-prefix=localization_demo_  --output-dir=lib/demo/i18n/intl/ --no-use-deferred-loading lib/demo/i18n/intl/intl_localization_demo.dart lib/demo/i18n/intl/intl_*.arb
*/
