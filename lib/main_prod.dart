import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:tv_randshow/config/flavor_config.dart';
import 'package:tv_randshow/config/secure_keys.dart';
import 'package:tv_randshow/src/ui/screens/tvshow_search_view.dart';

void main() {
  FlavorConfig(

      /// Populate a string [apiKey] in [secure_keys.dart], or put below your personal API Key from TMDB
      flavor: Flavor.PROD,
      values: FlavorValues(baseUrl: 'api.themoviedb.org', apiKey: apiKey));

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        FlutterI18nDelegate(useCountryCode: false, fallbackFile: 'en'),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TvshowSearchView(),
    );
  }
}