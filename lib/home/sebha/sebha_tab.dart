import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/settings_provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count = 0;
  List<String> name = ['سبحان الله', 'الحمد لله', 'الله اكبر'];
  int index = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    var settingsprovider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      body: Container(
        //margin:EdgeInsets.symmetric(vertical:70),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .37,
              child: Stack(
                children: [
                  Positioned(
                      left: MediaQuery.of(context).size.width * .46,
                      child: Image.asset(
                        settingsprovider.isDark()
                            ? 'assets/images/sebha_head_dark.png'
                            : 'assets/images/sebha_head.png',
                        height: MediaQuery.of(context).size.height * .12,
                      )),
                  Positioned(
                    child: InkWell(
                      onTap: () {
                        onclick();
                      },
                      child: Transform.rotate(
                        angle: angle,
                        child: Image.asset(
                          settingsprovider.isDark()
                              ? 'assets/images/sebha_body_dark.png'
                              : 'assets/images/sebha_body.png',
                          height: MediaQuery.of(context).size.height * .28,
                        ),
                      ),
                    ),
                    top: 70,
                    left: MediaQuery.of(context).size.width * .22,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'عدد التسبيحات',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 70,
                    color: Theme.of(context).primaryColor.withOpacity(.7),
                  ),
                  Text(
                    '$count',
                    style: Theme.of(context).textTheme.headline3,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 160,
                    height: 60,
                    color: Theme.of(context).accentColor,
                  ),
                  Text(name[index],
                      style: Theme.of(context).textTheme.headline1)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onclick() {
    count++;
    angle--;
    if (count == 34) {
      count = 0;
      index++;
      if (index >= name.length) {
        index = 0;
      }
    }
    setState(() {});
  }
}
