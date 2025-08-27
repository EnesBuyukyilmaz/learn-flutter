

import 'package:flutter/material.dart';
import 'package:flutter_application_1/PersonCounter.dart';
import 'package:flutter_application_1/TipSlider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      home: DisplayShare(),
    );
  }
}

class DisplayShare extends StatefulWidget {
  const DisplayShare({super.key});

  @override
  State<DisplayShare> createState() => _DisplayShareState();
}

class _DisplayShareState extends State<DisplayShare> {
  double _share = 125.1540;
  int _personNumber = 1;
  double _tipAmount = 0.0;



  void _decreasePeople() {
    setState(() {
      if (_personNumber > 1) {
        _personNumber -= 1;
        calculatorPerPerson();
      calculateTotalTips();
      }
    });
  }

  double _currentSliderValue = 0;
  void _incrasePeople() {
    setState(() {

      _personNumber += 1;
      calculatorPerPerson();
      calculateTotalTips();
    });
  }
  double _billAmount=0.0;
  double calculatorPerPerson(){
    _share = (_billAmount + _tipAmount) / _personNumber;
    print('${_billAmount + _tipAmount} bill ++');
    return _share;

  }
  double calculateTotalTips(){
    _tipAmount  =(_billAmount*_currentSliderValue)/200;
    print(_tipAmount);
    return _tipAmount;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var txtStyle = Theme.of(context).textTheme.displaySmall;
    return Scaffold(
      appBar: AppBar(title: Text('utip')),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 5),
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              children: [
                Text(
                  'Total per person ',
                  style: GoogleFonts.oswald().copyWith(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                Text(
                    '\$${_share.toStringAsFixed(2)}',
                  style: txtStyle!.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: theme.colorScheme.primary, width: 5),
              borderRadius: BorderRadius.circular(5),
            ),
            margin: EdgeInsets.all(20),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  BillAmount(theme: theme,onChanged: (String value) {
                    setState(() {
                    _billAmount = double.parse(value);
                    print('$_billAmount bill amount');  
                    calculateTotalTips();
                    calculatorPerPerson();

                    });
                  },),
                      

                  Container(
                    margin: EdgeInsets.fromLTRB(20, 30, 30, 12),
                    child: PersonCounter(
                      increase: _incrasePeople,
                      decrease: _decreasePeople,
                      txtStyle: txtStyle,
                      theme: theme,
                      personNumber: _personNumber,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tip', style: GoogleFonts.oswald(fontSize: 20)),
                      Text(
                        '\$${_tipAmount.toStringAsFixed(2)}',
                        style: GoogleFonts.oswald(fontSize: 20),
                      ),
                    ],
                  ),
                  Text('${(_currentSliderValue).round()/2}%'),
                TipSlider(currentSliderValue: _currentSliderValue ,f :(double value) {
                  setState(() {
                    _currentSliderValue = value;
                    calculateTotalTips();
                    calculatorPerPerson();
                  });
                }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BillAmount extends StatelessWidget {
  BillAmount({
    super.key,
    required this.theme,
    required this.onChanged,
  });
  ValueChanged<String> onChanged;

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return TextField(

      onChanged:onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.attach_money),
        labelText: 'Bill Amaount',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 5,
            color: theme.colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 5,
            color: theme.colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
    );
  }
}

