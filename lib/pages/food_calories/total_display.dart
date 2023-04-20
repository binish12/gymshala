import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';


import '../../theme.dart';

class TotalDisplay extends StatelessWidget {
   const TotalDisplay({Key? key, required this.totalCalories,required this.quantity,required this.carbohydrates,required this.fats,required this.protein,required this.selectedQuantity}): super(key: key);
  final String totalCalories;
  final String quantity;
  final String carbohydrates;
  final String fats;
  final String protein;
  final String selectedQuantity;

  @override
  Widget build(BuildContext context) {
    double calory = double.parse(totalCalories);
    double c = double.parse(carbohydrates);
    double f = double.parse(fats);
    double p = double.parse(protein);
    double inputQuantity = double.parse(selectedQuantity);
    double disCalories = calory * inputQuantity;
    double carb = c * inputQuantity;
    double fat = f * inputQuantity;
    double pro = p * inputQuantity;
    double progress;
    
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children:  [
             
            Text("Selected Quantity is: $selectedQuantity"),
          ],
        
        ),
      ),
      

    );
  }
}