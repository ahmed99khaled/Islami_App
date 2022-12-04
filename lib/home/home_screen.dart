import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home/hadeth/hadeth_tab.dart';
import 'package:islami/home/quran/quran_tab.dart';
import 'package:islami/home/radio/radio_tab.dart';
import 'package:islami/home/sebha/sebha_tab.dart';
import 'package:islami/home/settings/settings_tab.dart';
import 'package:provider/provider.dart';

import '../providers/settings_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int indexCurrent = 0;

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          settingsProvider.getMainBackground(),
        ),
        fit: BoxFit.fill,
      )),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.appTitle,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (newlySelected) {
              setState(() {
                indexCurrent = newlySelected;
              });
            },
            currentIndex: indexCurrent,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: ImageIcon(AssetImage('assets/images/icon_quran.png')),
                label: AppLocalizations.of(context)!.quran_label,
              ),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: ImageIcon(AssetImage('assets/images/icon_sebha.png')),
                  label: AppLocalizations.of(context)!.sebha_label),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: ImageIcon(AssetImage('assets/images/icon_hadeth.png')),
                  label: AppLocalizations.of(context)!.hadeth_label),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: ImageIcon(AssetImage('assets/images/icon_radio.png')),
                  label: AppLocalizations.of(context)!.radio_label),
              BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.settings_label),
            ]),
        body: tabs[indexCurrent],
      ),
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    SebhaTab(),
    HadethTab(),
    RadioTab(),
    SettingsTab()
  ];
}
