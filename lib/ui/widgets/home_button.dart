import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:unicons/unicons.dart';

import '../../core/utils/constants.dart';
import '../views/tab_view.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16.0),
      child: FlatButton.icon(
        label: Text(
          kIsWeb
              ? translate('app.loading.button_search')
              : translate('app.loading.button_fav'),
          key: const Key(
            kIsWeb ? 'app.loading.button_search' : 'app.loading.button_fav',
          ),
        ),
        icon: const Icon(kIsWeb ? UniconsLine.search : UniconsLine.favorite),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        onPressed: () => Navigator.pushNamedAndRemoveUntil<TabView>(
          context,
          RoutePaths.TAB,
          ModalRoute.withName(RoutePaths.TAB),
        ),
      ),
    );
  }
}
