import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gymshala/controllers/foods_controller.dart';

import 'package:gymshala/controllers/notices_controller.dart';
import 'package:gymshala/custom_buttons/notification_bell.dart';

import 'package:gymshala/model/notice_model.dart';
import 'package:gymshala/pages/calorie_calculator/home_screen.dart';

import 'package:gymshala/pages/workout_pages/weight_goal.dart';
import 'package:gymshala/pages/workout_pages/workout_page.dart';



class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final foodcontroller = Get.put(FoodController());
  final noticecontroller = Get.put(NoticeController());

  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Gymshala'),
        actions: [
          NotificationBellButton(notificationCount:noticecontroller.unreadCount)
        ],
      ),
      
      body: SingleChildScrollView(
        child: Center(
          
          child: Column(

            
            
            children: [
              
              
              

              ElevatedButton(
                onPressed: (() {
                  Get.to(const WeightGoal());
                  
                  
                  
                }),

                child: const Text("Workouts"),
              ),

              ElevatedButton(
                onPressed: (() {
                  Get.to(const HomeScreen());
                  
                  
                  
                }),

                child: const Text("Calorie Calculator"),
              ),


               ElevatedButton(
                onPressed: (() {
                  Get.to(const WorkoutPage());
                  
                  
                  
                }),

                child: const Text("Workout PDF"),
              ),

              ElevatedButton(
                
                onPressed: (() {
                  foodcontroller.getBottomSheet();

                  
                }),
                child: const Text("Food Calories"),

                
              ),
              
              

            ],
          ),

        ),
      ),
     
    
    );
  }
}