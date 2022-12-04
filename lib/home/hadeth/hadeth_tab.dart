import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home/hadeth/hadeth_title_widget.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<hadethData> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (ahadeth.isEmpty) {
      loadHadethFile();
    }
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Image.asset('assets/images/hadeth_image.png'),
          Divider(
            thickness: 2,
            color: Theme.of(context).accentColor,
          ),
          Text(
            AppLocalizations.of(context)!.ahadeth,
            style: Theme.of(context).textTheme.headline4,
          ),
          Divider(
            thickness: 2,
            color: Theme.of(context).accentColor,
          ),
          ahadeth.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) =>
                        HadethTitleWidget(ahadeth[index]),
                    separatorBuilder: (context, index) => Divider(
                      thickness: 1,
                      indent: 55,
                      endIndent: 55,
                      color: Theme.of(context).accentColor,
                    ),
                    itemCount: ahadeth.length,
                  ),
                ),
        ],
      ),
    );
  }

  void loadHadethFile() async {
    String content = await rootBundle.loadString('assets/files/ahadeth .txt');
    List<String> allAhadeth = content.trim().split('#\r\n');
    for (int i = 0; i < allAhadeth.length; i++) {
      String hadeth = allAhadeth[i];
      List<String> hadethlines = hadeth.split('\n');
      String title = hadethlines[0];
      hadethlines.removeAt(0);
      hadethData HadethData = hadethData(title, hadethlines);
      ahadeth.add(HadethData);
    }
    setState(() {});
  }
}

class hadethData {
  String title;
  List<String> content;

  hadethData(this.title, this.content);
}
