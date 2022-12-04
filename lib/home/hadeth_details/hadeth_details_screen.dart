import 'package:flutter/material.dart';
import 'package:islami/home/hadeth/hadeth_tab.dart';
import 'package:provider/provider.dart';

import '../../providers/settings_provider.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const String routeName = 'HadethDetailsScreen';

  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as hadethData;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(settingsProvider.getMainBackground()),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.title),
        ),
        body: Column(
          children: [
            Expanded(
              child: Card(
                elevation: 25,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      args.content[index],
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.right,
                    ),
                  ),
                  itemCount: args.content.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
