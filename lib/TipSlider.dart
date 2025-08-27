import 'package:flutter/material.dart';

class TipSlider extends StatelessWidget {
  
  
  TipSlider({
    required this.f,
    super.key,
    required double currentSliderValue,
  }) : _currentSliderValue = currentSliderValue;
  final ValueChanged<double> f;
  final double _currentSliderValue;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentSliderValue,
      max: 100,
      onChanged :f ,
      divisions: 5,
      
    );
  }
}
