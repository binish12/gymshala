import 'package:carousel_slider/carousel_slider.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:gymshala/controllers/bannerko_controller.dart';
import 'package:gymshala/controllers/banners_controller.dart';
import 'package:gymshala/controllers/foods_controller.dart';

import 'package:gymshala/controllers/notices_controller.dart';
import 'package:gymshala/custom_appbar.dart';
import 'package:gymshala/custom_buttons/notification_bell.dart';

import 'package:gymshala/model/notice_model.dart';
import 'package:gymshala/pages/calorie_calculator/home_screen.dart';
import 'package:gymshala/pages/profile_page/profile.dart';

import 'package:gymshala/pages/workout_pages/weight_goal.dart';
import 'package:gymshala/pages/workout_pages/workout_page.dart';
import 'package:gymshala/widgets/bottom_navbar.dart';

import '../api.dart';



class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final foodcontroller = Get.put(FoodController());
  final noticecontroller = Get.put(NoticeController());
  final bannercontroller = Get.put(BannerController());
  final bancont = Get.put(BannerkoController());
 
  final List<String> imageUrls = [  
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80', 
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',   
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80', 
     ];


@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: CustomAppBar(),
    body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Stack(
              
              children: [
                Container(
                  height: Get.height / 5,
                  width: Get.width,

                  decoration: const BoxDecoration(
                    color: Color(0xFFC1121F),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.elliptical(1100, 350),
                      bottomLeft: Radius.elliptical(1100, 350),
                    ),
                  ),
                ),
                
  //               Padding(
  //                 padding: const EdgeInsets.only(top: 25),
  //                 child: CarouselSlider( 
  //                   items: bannercontroller.banners.map((banner) {
  //   return ClipRRect(

  //     borderRadius: BorderRadius.circular(20),
  //     child: Image.network(
  //       bancont[]['image'],
        
  //       fit: BoxFit.cover,
  //     ),
  //   );
  // }).toList(),
                              
                   
  //                   options: CarouselOptions(
                      
                      
                     
  //                     enlargeCenterPage: true,
  //                     autoPlay: true,
  //                     aspectRatio: 16/7,
  //                     autoPlayCurve: Curves.fastOutSlowIn,
  //                     enableInfiniteScroll: true,
  //                     autoPlayAnimationDuration:
  //                         const Duration(milliseconds: 800),
  //                     viewportFraction: 0.68,
  //                   ),
  //                 ),
  //               ),
              ],
            ),
            
            const SizedBox(
              height: 100,
            ),
            
         
            
      //  CircularCountDownTimer(
      //     duration: 30,
      //     initialDuration: 30,
      //     controller: CountDownController(),
      //     width: MediaQuery.of(context).size.width / 2,
      //     height: MediaQuery.of(context).size.height / 2,
      //     ringColor: Colors.grey[300]!,
      //     ringGradient: null,
      //     fillColor: Colors.blueAccent,
      //     fillGradient: null,
      //     backgroundColor: Colors.transparent,
      //     backgroundGradient: null,
      //     strokeWidth: 20.0,
      //     strokeCap: StrokeCap.round,
      //     textStyle: const TextStyle(
      //         fontSize: 33.0, color: Colors.black, fontWeight: FontWeight.bold),
      //     textFormat: CountdownTextFormat.SS,
      //     isReverse: true,
      //     isReverseAnimation: false,
      //     isTimerTextShown: true,
      //     autoStart: true,
      //     onStart: () {
      //       print('Countdown Started');
      //     },
      //     onComplete: () {
      //       print('Countdown Ended');
      //     },
      //   ),


           
            







            
            // ElevatedButton(
            //   onPressed: () {
            //     Get.to(const WeightGoal());
            //   },
            //   child: const Text("Workouts"),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     Get.to(const HomeScreen());
            //   },
            //   child: const Text("Calorie Calculator"),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     Get.to(const WorkoutPage());
            //   },
            //   child: const Text("Workout PDF"),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     foodcontroller.getBottomSheet();
            //   },
            //   child: const Text("Food Calories"),
            // ),
          ],
        ),
      ),
    ),
   

    bottomNavigationBar: AppBottomNavigationBar(selectedIndex: 0),


  );
}
}