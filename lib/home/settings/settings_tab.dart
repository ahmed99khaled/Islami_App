import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home/settings/language_bottom_sheet.dart';
import 'package:islami/home/settings/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../../providers/settings_provider.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              showTHemeBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: Theme.of(context).accentColor, width: 1.5)),
              child: Text(
                settingsProvider.currentTheme == ThemeMode.light
                    ? AppLocalizations.of(context)!.light
                    : AppLocalizations.of(context)!.dark,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: Theme.of(context).accentColor, width: 1.5)),
              child: Text(
                AppLocalizations.of(context)!.english,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showTHemeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (buideContext) => ThemeBottomSheet());
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (buideContext) => LanguageBottomSheet(),
    );
  }
}
