import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  // napsali jsme si sami tlačítko do widgetu se dostanu přes ;command a klik myší a tam vidím co je jak nastavené a můžu jít hlouběji a hlouběji
  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      elevation: 0.0, // shadow
      shape: CircleBorder(),
      fillColor: Color(0xff4C4f5e),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
