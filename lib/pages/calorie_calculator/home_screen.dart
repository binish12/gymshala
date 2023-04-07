
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymshala/controllers/activity_controller.dart';
import 'package:gymshala/pages/calculator_page.dart';
import 'package:gymshala/pages/calorie_calculator/activity.dart';
import 'package:gymshala/pages/calorie_calculator/age_weight_widget.dart';
import 'package:gymshala/pages/calorie_calculator/gender_widget.dart';
import 'package:gymshala/pages/calorie_calculator/height_widget.dart';
import 'package:gymshala/pages/calorie_calculator/new_page.dart';
import 'package:gymshala/pages/home_page.dart';
import 'package:gymshala/widgets/bottom_navbar.dart';

import 'package:swipeable_button_view/swipeable_button_view.dart';

class HomeScreen extends StatefulWidget {
  
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _gender = 0;
  int _height = 150;
  int _age = 30;
  int _weight = 50;
  bool _isFinished = false;
  double _bmrScore = 0;
  ActivityController activityController = Get.put(ActivityController());
  
  var maintainanceCalories;
  var surplus;
  var deficit;

  List<bool> _isSelected = [false, false];
  List<String> _options = ['Option 1', 'Option 2'];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Card(
              elevation: 12,
              shape: const RoundedRectangleBorder(),
              child: Column(
                children: [
                  //Lets create widget for gender selection
                  GenderWidget(
                    onChange: (genderVal) {
                      _gender = genderVal;
                    },
                  ),
                  HeightWidget(
                    onChange: (heightVal) {
                      _height = heightVal;
                    },
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AgeWeightWidget(
                          onChange: (ageVal) {
                            _age = ageVal;
                          },
                          title: "Age",
                          initValue: 21,
                          min: 0,
                          max: 100),

                          SizedBox(width: 40,),

                      AgeWeightWidget(
                          onChange: (weightVal) {
                            _weight = weightVal;
                          },
                          title: "Weight(Kg)",
                          initValue: 50,
                          min: 0,
                          max: 200)
                    ],
                  ),
                  const SizedBox(height: 25,),
                  
                   ActivitySelection(),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 60),
                    child: SwipeableButtonView(
                        isFinished: _isFinished,
                        onFinish: () async {
                          if (_bmrScore != 0 && maintainanceCalories != 0 ){
                            Get.snackbar("Success", 
                            "Maintainance calories calculated successfully",
                            backgroundColor: Colors.green,
                            colorText: Colors.white
                            );
                            await Get.to(NewPage(maintainanceCalories,surplus,deficit));
                         
                          }
                          else {
                            Get.offAll(CalculatorPage());
                          }

                  

                        

                          
                         
                        },
                        onWaitingProcess: () {
                          //Calculate BMR here
                          calculateBmr();
                          calculateMaintainance();

                          Future.delayed(const Duration(seconds: 2), () {
                            setState(() {
                              _isFinished = true;
                            });
                          });
                        },
                        activeColor: Color(0xFFC1121F),
                        buttonWidget: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                        ),
                        buttonText: "CALCULATE"),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: AppBottomNavigationBar(selectedIndex: 1),
        );
  }

  void calculateBmr() {
    if (_gender == 1){
      _bmrScore = 10 * _weight + 6.25 * _height -5 * _age + 5;
    }
    else if(_gender == 2){
      _bmrScore = 10 * _weight + 6.25 * _height -5 * _age - 161;
    }
    else {
      Get.snackbar("Error", "Please select your Gender",
       
      backgroundColor: Colors.red[400],colorText: Colors.white);
    }
    
  }

  void calculateMaintainance(){

  var activityLevel = activityController.selectedActivity.value;

    if(activityLevel == "1"){

      maintainanceCalories = _bmrScore * 1.2;
    }

    else if(activityLevel == "2"){
      maintainanceCalories = _bmrScore * 1.5;

    }

    else if(activityLevel == "3"){
      maintainanceCalories = _bmrScore * 1.75;
      
    }

    else if(activityLevel == "4"){
      maintainanceCalories = _bmrScore * 2;
      
    }

    else if(activityLevel == "5"){
      maintainanceCalories = _bmrScore * 2.4;
      
    }

    else {
      _bmrScore = 0;
      maintainanceCalories = 0;
      Get.snackbar("Error", "Please select your Activity Level",
       
      backgroundColor: Colors.red[400],colorText: Colors.white);
    }

   surplus = maintainanceCalories + 288.65;
   deficit = maintainanceCalories - 280.53;

  }
}

