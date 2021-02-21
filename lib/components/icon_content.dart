import 'package:flutter/material.dart';
import '../constants.dart';

class CardChildIcon extends StatelessWidget {
  CardChildIcon(
      {@required this.genderIcon,
      @required this.genderText}); // => tohle je konstruktor
  final IconData genderIcon; //=> tohle je property
  final String genderText; //=> tohle je property

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          genderText,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
