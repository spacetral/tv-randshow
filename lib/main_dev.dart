import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:tv_randshow/config/flavor_config.dart';
import 'package:tv_randshow/config/secure_keys.dart';
import 'package:tv_randshow/src/models/app_model.dart';
import 'package:tv_randshow/src/ui/screens/tvshow_search_view.dart';

void main() {
  final AppModel appModel = AppModel();

  /// Populate a string [apiKey] in [secure_keys.dart], or put below your personal API Key from TMDB
  FlavorConfig(
      flavor: Flavor.DEV, values: FlavorValues(baseUrl: 'api.themoviedb.org', apiKey: apiKey));
  appModel.init();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      localizationsDelegates: [
        FlutterI18nDelegate(useCountryCode: false, fallbackFile: 'en'),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TvshowSearchView(),
    );
  }
}

// _request() async {
//   TvshowSearch tvshowSearch;
//   final apiKey = await secureStorage.readStorage(KeyStorate.API_KEY);
//   var queryParameters = {'api_key': apiKey, 'language': 'en-US', 'page': '1', 'query': 'friends'};
//   var uri = Uri.https(Url.apiUrl, Url.TVSHOW_SEARCH, queryParameters);
//   print(uri.toString());
//   ApiProvider().requestGet(uri.toString()).then((response) {
//     print('Reponse: ${response.statusCode}');
//     tvshowSearch = TvshowSearch.fromRawJson(response.body);
//     tvshowSearch.results.forEach((f) {
//       print('Name of results: ${f.name}');
//     });
//   });
// }