import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/settings_provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                settingsProvider.changeLanguage('en');
              },
              child: settingsProvider.language == 'ar'
                  ? getUnselectedItem(AppLocalizations.of(context)!.english)
                  : getSelectedItem(AppLocalizations.of(context)!.english)),
          SizedBox(
            height: 24,
          ),
          InkWell(
              onTap: () {
                settingsProvider.changeLanguage('ar');
              },
              child: settingsProvider.language == 'ar'
                  ? getSelectedItem(AppLocalizations.of(context)!.arabic)
                  : getUnselectedItem(AppLocalizations.of(context)!.arabic)),
        ],
      ),
    );
  }

  Widget getSelectedItem(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$title',
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: Theme.of(context).accentColor),
        ),
        Icon(
          Icons.check,
          color: Theme.of(context).accentColor,
        ),
      ],
    );
  }

  Widget getUnselectedItem(String title) {
    return Text(
      '$title',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
