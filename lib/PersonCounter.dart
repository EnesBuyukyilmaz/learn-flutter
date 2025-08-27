import 'package:flutter/material.dart';

class PersonCounter extends StatelessWidget {
  VoidCallback increase;
  VoidCallback decrease;

  PersonCounter(
    {
    required this.increase,
    required this.decrease,
    super.key,
    required this.txtStyle,
    required this.theme,
    required int personNumber,
  }) : _personNumber = personNumber;

  final TextStyle? txtStyle;
  final ThemeData theme;
  final int _personNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('Split', style: txtStyle!.copyWith(fontSize: 20)),
    
        Container(
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: decrease,
                icon: Icon(
                  Icons.remove,
                  color: theme.colorScheme.primary,
                ),
              ),
              Text(
                '$_personNumber',
                style: txtStyle!.copyWith(fontSize: 20),
              ),
              IconButton(
                onPressed: increase,
                icon: Icon(
                  Icons.add,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}