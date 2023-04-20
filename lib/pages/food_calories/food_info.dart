import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';


import '../../theme.dart';

class FOODInfo extends StatelessWidget {
   const FOODInfo({Key? key, required this.totalCalories,required this.quantity,required this.carbohydrates,required this.fats,required this.protein,required this.selectedQuantity}): super(key: key);
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
             Text("Chicken Breast",style: TextStyle(fontSize: 30),),

             const SizedBox(height: 45,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
               
                 macrosStats("Calories",disCalories ,"kcal",Colors.blue,1),
                 macrosStats("Proteins",pro,"gm",const Color.fromARGB(255, 54, 202, 106),p),
              ],
            ),
            const SizedBox(height: 20),
           
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                macrosStats("Carbohydrates",carb,"gm",const Color.fromARGB(255, 57, 193, 214),c),
                macrosStats("Fats",fat,"gm",const Color.fromARGB(255, 216, 54, 244),f),
              ],
            ),
            
            
            
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [

            

            
            
          ],
            ),
            const SizedBox(height: 20),
            Text("Selected Quantity is: $selectedQuantity"),
          ],
        
        ),
      ),
      

    );
  }
}

Widget _circleProgress() {
    return SizedBox(
      width: 160 ,
      height: 160,
      child: Stack(
        children: [
          const SizedBox(
            width: 160,
            height: 160,
            child: CircularProgressIndicator(
              strokeWidth: 8,
              value: 0.7,
              backgroundColor: Color.fromARGB(255, 83, 255, 9),
              valueColor: AlwaysStoppedAnimation < Color > (Color.fromARGB(255, 65, 25, 25)),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              margin: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color.fromARGB(255, 224, 18, 18), width: 8),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 4, 114, 223),
                ),
                child: Container(
                  margin: const EdgeInsets.all(22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Remaining',
                        style: TextStyle(
                          color: AppColors.colorTint300,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '1,112',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        'kcal',
                        style: TextStyle(
                          color: AppColors.colorTint300,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


Widget macrosStats(var title,double amount,var unit,var bgcolor,double progressBar) {
  

    return Container(
      height: Get.height/4,
      width: Get.width/2.2,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgcolor,
        borderRadius: BorderRadius.circular(25)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const FaIcon(
                FontAwesomeIcons.fire,
                color: Colors.orange,
              ),
            ],
          ),
          Row(
            children: [
              RotatedBox(
                quarterTurns: -1,
                child: LinearPercentIndicator(
                  width: 60,
                  animation: true,
                  lineHeight: 6,
                  animationDuration: 2500,
                  percent: progressBar,
                  barRadius: const Radius.circular(3),
                  progressColor: Colors.white,
                  padding: EdgeInsets.zero,
                  backgroundColor: AppColors.colorTint400.withOpacity(0.4),
                ),
              ),
              const SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    amount.toStringAsFixed(2)
                     ,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    unit,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
