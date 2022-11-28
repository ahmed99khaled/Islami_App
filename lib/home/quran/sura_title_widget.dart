import 'package:flutter/material.dart';
import 'package:islami/home/sura_details/sura_details_args.dart';
import 'package:islami/home/sura_details/sura_details_screen.dart';

class SuraTitleWidget extends StatelessWidget {
  String title;
  int index;

  SuraTitleWidget({required this.title, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, SuraDetailsScreen.routeName,
            arguments: SuraDetailsArgs(title: title, index: index));
      },
      child: Container(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 28,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
