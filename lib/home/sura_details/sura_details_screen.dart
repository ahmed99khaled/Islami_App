import 'package:flutter/material.dart';
import 'package:islami/home/sura_details/sura_details_args.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = 'Soura Details Screen';

  @override
  Widget build(BuildContext context) {
    SuraDetailsArgs? args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/main_background.png'),
          fit: BoxFit.fill,
        )),
        child: Scaffold(
          appBar: AppBar(
            title: Text(args.title),
          ),
        ));
  }
}
