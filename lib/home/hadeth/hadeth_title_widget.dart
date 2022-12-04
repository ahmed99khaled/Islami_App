import 'package:flutter/material.dart';
import 'package:islami/home/hadeth/hadeth_tab.dart';

import '../hadeth_details/hadeth_details_screen.dart';

class HadethTitleWidget extends StatelessWidget {
  hadethData hadethdata;

  HadethTitleWidget(this.hadethdata);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          HadethDetailsScreen.routeName,
          arguments: hadethdata,
        );
      },
      child: Text(hadethdata.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4),
    );
  }
}
