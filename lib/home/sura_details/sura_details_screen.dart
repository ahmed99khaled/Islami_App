import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/home/sura_details/sura_details_args.dart';
import 'package:islami/home/sura_details/verse_widget.dart';
import 'package:provider/provider.dart';

import '../../providers/settings_provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'Soura Details Screen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    SuraDetailsArgs? args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      readfile(args.index + 1);
    }
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(settingsProvider.getMainBackground()),
          fit: BoxFit.fill,
        )),
        child: Scaffold(
          appBar: AppBar(
            title: Text(args.title),
          ),
          body: Card(
            elevation: 28,
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ListView.separated(
              itemBuilder: (context, index) =>
                  VerseWidget(content: verses[index], index: index + 1),
              itemCount: verses.length,
              separatorBuilder: (context, index) => Divider(
                endIndent: 40,
                indent: 40,
                thickness: 1,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
        ));
  }

  void readfile(int fileIndex) async {
    String fileContent =
        await rootBundle.loadString('assets/files/$fileIndex.txt');
    List<String> lines = fileContent.trim().split('\n');

    setState(() {
      verses = lines;
    });
  }
}
