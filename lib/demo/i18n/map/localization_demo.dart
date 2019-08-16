import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class LocalizationDemo {
  final Locale locale;
  LocalizationDemo(this.locale);

  static Map<String, Map<String, String>> _localized = {
    'en': {
      'title': 'hello',
    },
    'zh': {
      'title': "您好",
    }
  };

  String get title {
    return _localized[locale.languageCode]['title'];
  }
}

class LocalizationDemoDelegate extends LocalizationsDelegate<LocalizationDemo> {
  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  Future<LocalizationDemo> load(Locale locale) {
    return SynchronousFuture<LocalizationDemo>(LocalizationDemo(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<LocalizationDemo> old) {
    return false;
  }
}
