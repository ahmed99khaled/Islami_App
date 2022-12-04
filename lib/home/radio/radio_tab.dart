import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/radio_image.png'),
          SizedBox(
            height: 26,
          ),
          Text(
            'اذاعة القران الكريم',
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  iconSize: 32,
                  icon: Icon(
                    Icons.skip_previous,
                    color: Theme.of(context).accentColor,
                  )),
              IconButton(
                  onPressed: () {},
                  iconSize: 60,
                  icon: Icon(
                    Icons.play_arrow_rounded,
                    color: Theme.of(context).accentColor,
                  )),
              IconButton(
                  onPressed: () {},
                  iconSize: 32,
                  icon: Icon(
                    Icons.skip_next,
                    color: Theme.of(context).accentColor,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
