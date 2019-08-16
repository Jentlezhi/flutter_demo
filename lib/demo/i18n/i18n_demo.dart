import 'package:flutter/material.dart';

import 'map/localization_demo.dart';

class I18nDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('I18nDemo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${locale.languageCode}'),
            SizedBox(height: 10.0),
            Text(
              Localizations.of(context, LocalizationDemo).title,
              style: Theme.of(context).textTheme.title,
            ),
          ],
        ),
      ),
    );
  }
}
