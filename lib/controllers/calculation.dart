import 'dart:math';
import 'package:flutter/material.dart';
class Calculator
{
  Calculator({required this.height, required this.weight});
  final int height;
  final int weight;

  double _bmi = 0;

  calculateBMI()
  {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  getResult()
  {
    if (_bmi >= 30) {
      return "Obese";
    }
    else if (_bmi >= 25) {
      return "OverWeight";
    }
    else if (_bmi >= 18.5) {
      return "Normal";
    } else {
      return "UnderWeight";
    }
  }

  getColour()
  {
    if (_bmi >= 30) {
        return Colors.red;
      }
    else if (_bmi >= 25) {
      return Colors.deepOrange;
    }
    else if (_bmi > 18.5) {
      return Colors.green;
    } else {
      return Colors.blue;
    }
  }

  advice()
  {
    if (_bmi >= 30) {
      return "It's not good for your health, workout daily.";
    }
    else if (_bmi >= 25) {
      return "Try to do more exercise to be healthy.";
    } else if (_bmi > 18.5) {
      return "Good job, you're healthy. Try to maintain it.";
    } else {
      return "Try to eat more good food and do exercise to be healthy.";
    }
  }

}