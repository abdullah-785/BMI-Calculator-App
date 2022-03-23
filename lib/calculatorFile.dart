import 'dart:math';

import 'package:flutter/cupertino.dart';


class CalculatorBain{
  final int height;
  final int weight;
  double _bmi;

  CalculatorBain(@required this.height, @required this.weight);

  String calculateBMI(){
    _bmi = weight / pow(height/ 100,2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi > 25){
      return "Over Weight";
    }

    if(_bmi > 18.5){
      return "Normal";
    }

    else{
      return "Under Weight";
    }
  }


  String getInterpertation(){
    if(_bmi >= 25){
      return "You have a higher than normal weight. Try to exercise more";
    }

    if(_bmi >= 18.5){
      return "You have a normal body weight. Good Job!!";
    }

    else{
      return "You have lower than normal body weight. You can eat more.";
    }
  }


  
}


