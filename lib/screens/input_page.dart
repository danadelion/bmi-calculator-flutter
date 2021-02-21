import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_Card.dart';
import '../constants.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import '../components/round_icon_button.dart';

//je to jednodušší ke změněně v jednotlivých kontainerech

enum Gender {
  // vytvářím si seznam možností, statický seznam, který se nemění, vždycky začíná velkým písmenem jako třída např. Gender, můžu ho použít jako Gender, pomocí kterého si to "volám", kód se pak mnohem lépe čte
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // další způsob zápisu ifu
  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;

  //enum EnumName =>enumy začínají na velké písmeno jako třídy
  // Dart ternary operator => zkrácené if, pouze u jedné řádky
  //Condition ? DoThisIfTrue : DoThisIfFalce =====
  // if(condition){DoThisIfTrue}else{DoThisIfFalce}
  // můžu udělat toto: bool canBuyAlcohol = myAge >= 21 ? true : false

  Gender selectedGender;
  // 1 = male, 2 = female
  // //void updateColor(Gender selectedGender) {
  //   //=> metoda
  //   print(selectedGender);
  //   //male card pressed
  //   if (selectedGender == Gender.male) {
  //     if (maleCardColor == inactiveCardColor) {
  //       maleCardColor = activeCardColor;
  //     } else {
  //       maleCardColor = inactiveCardColor;
  //     }
  //     femaleCardColor = inactiveCardColor;
  //   }
  //   //female card pressed
  //   if (selectedGender == Gender.female) {
  //     if (femaleCardColor == inactiveCardColor) {
  //       femaleCardColor = activeCardColor;
//      } else {
  //       femaleCardColor = inactiveCardColor;
//      }
  //     maleCardColor = inactiveCardColor;
  //   }
  // }
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  color: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: CardChildIcon(
                    genderIcon: FontAwesomeIcons.mars,
                    genderText: 'Male',
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  color: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: CardChildIcon(
                    genderIcon: FontAwesomeIcons.venus,
                    genderText: 'Female',
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      // .of(context).copyWith znamená že si změním základní nastavení od flutteru
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8d8e98),
                      overlayColor: kBottomContainerColor.withAlpha(0x29),
                      thumbColor: kBottomContainerColor,
                      //když chci zprůhlednit barvu dám ".withAlpha(0x29)," => 13% průhlednost protože je to hexadecimální
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(
                                  () {
                                    weight--;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(
                                  () {
                                    weight++;
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(
                                  () {
                                    age--;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(
                                  () {
                                    age++;
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'Calculate',
            onTap: () {
              CalculatorBrain calculationBrain =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calculationBrain.calculateBMI(),
                    resultText: calculationBrain.getResults(),
                    interpretation: calculationBrain.getInterperatiton(),
                  ),
                ),
              );
              //Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage())),        tohle je další zápis
            },
          ),
        ],
      ),
    );
  }
}

//pokud se nám nějaký Widget opakuje v kódu, mužu si udělat to co je dole. vytvořím si Conteiner jen jednou a ve Flutter Outline (vpravo nabídka) si najdu ten container co jsem vytvořila + pr.m. + Extract Widget + pojmenuju jak chci => vytvoří to, co je níže samo a pak si do míst kde má být container v kódu výše

//část s key class smažeme, více si můžeme o této třídě najít ve videu na youtube "When to use Keys - Flutter Widgets 101 Ep. 4'
//const ReusableCard({
//     Key key, // key class
//   }) : super(key: key);

//istance Variable = Field = Property => nastavení
//immutability => nezměniitelné (unchangeble) nemůžu je změnit
////jak ale to udělám změnitelné => zruším ten nezměnitelný a nahradím měnitelným
//StatelessWidget je vždy immutable => proto dávám 'final'

//int myNumber = 2;
////int = data type that conatain the variable => může být změněno
////myNumber =name of variable
////2= value that contain the variable
//const int myConst =2; => může být změněno jen jednou, je to nezměněné
// final int myFinal =3; => tohle už pak nelze změnit nede už napsat myConst = 4, nemůže být změněno po tom co to je vytvořené
//kdy použiju const a kdy final:
////const = lze sestavit např. const int myConst = 2+5*8; => nemůžu být v runapp
//// final myFinal = DateTime.now(); print(myFinal);
//

//Dart maps
//něco jako list (seznam) máme tam key a něco co k tomu patří, klíč si určujeme sami
//Map<KeyType, ValueType> mapName{
//'/'key: Value,
// }
// např. Map<String, int> phoneBook = {
//'Kyle': 24523452345,
//'Jim':69689689,
// }
//main(){print(phoneBook['Jim']);     => volám telefoní číslo Jim
//}
