import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymshala/controllers/workout_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/bottom_navbar.dart';
import '../../widgets/item_card.dart';





final workoutcontroller = Get.put(WorkoutController());
final List<String> imgurl = [  
    'https://recxpress.com.au/wp-content/uploads/2019/05/WARM-UP-EXERCISES-YOU-CAN-DO-BEFORE-HITTING-YOUR-WORKOUT-1.jpg',
    'https://img.freepik.com/free-photo/muscular-man-doing-push-ups-one-hand_7502-4775.jpg', 
    'https://img.freepik.com/premium-photo/strong-sportsman-doing-battle-rope-exercise-cross-fit-gym-having-intense-training-alone-concentrated-caucasian-man-doing-cross-fit-exercise-while-working-out-gym-sportswear_183219-6096.jpg',
    'https://img.freepik.com/premium-photo/shirtless-man-flipping-heavy-tire_136403-904.jpg',
    'https://hips.hearstapps.com/hmg-prod/images/handsome-muscular-man-in-a-t-shirt-and-shorts-doing-royalty-free-image-1592513811.jpg?crop=1.00xw:0.752xh;0,0.207xh&resize=1200:*',
    'https://t4.ftcdn.net/jpg/02/07/90/87/360_F_207908753_IgTqqhNJMOnWOgSNLXayj6MYaj91gdjp.jpg',
    'https://cdn.muscleandstrength.com/sites/default/files/styles/800x500/public/forget_steroids_-_1200x630.jpg?itok=5lU-DkFG',
    'https://www.muscleandfitness.com/wp-content/uploads/2019/01/bench-press-7-1012627612.jpg?w=1109&quality=86&strip=all',
    'https://img.freepik.com/free-photo/woman-working-out-with-barbell-gym_23-2149337987.jpg',
    
    

    ];




class WorkoutPage extends StatelessWidget {
  const WorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Choose the workout type"),
          centerTitle: true,


          

        ),
        body: SingleChildScrollView(
          
          child: Column(children: [
            
            
            SizedBox(height: 10,),
            Column(
              children: [
                AllItemCard(imgs: imgurl[0],name: "Warmups",fileId: 22,),
                SizedBox(height: 20,),

                AllItemCard(imgs: imgurl[1],name: "Strength Training",fileId: 20,),
                SizedBox(height: 20,),

                AllItemCard(imgs: imgurl[2],name: "Hypertrophy Training",fileId: 19,),
                SizedBox(height: 20,),

                AllItemCard(imgs: imgurl[5],name: "Powerlifting Training",fileId: 23,),
                SizedBox(height: 20,),

                AllItemCard(imgs: imgurl[4],name: "Home Workout (Body weight)",fileId: 24,),
                SizedBox(height: 20,),

                AllItemCard(imgs: imgurl[7],name: "Upper Lower Split Training",fileId: 21,),
                SizedBox(height: 20,),

                AllItemCard(imgs: imgurl[3],name: "Bro Split Training",fileId: 20,),
                SizedBox(height: 20,),

                AllItemCard(imgs: imgurl[6],name: "Push Pull Leg Split Training",fileId: 19,),
                SizedBox(height: 20,),

                
                

              ],
            ),

        


          ]),
        ),
        bottomNavigationBar: AppBottomNavigationBar(selectedIndex: 2),

        ),

    );


    
  }
  Future<void> launchInBrowser(String url) async {
    try {
      final Uri toLaunch = Uri.parse(url);
      await launchUrl(toLaunch, mode: LaunchMode.externalApplication);
    } catch (e) {
      log("couldnot launch ------->");
    }
  }
}