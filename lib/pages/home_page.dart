import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymshala/controllers/bannerko_controller.dart';
import 'package:gymshala/controllers/banners_controller.dart';
import 'package:gymshala/controllers/foods_controller.dart';
import 'package:gymshala/controllers/notices_controller.dart';
import 'package:gymshala/custom_appbar.dart';
import 'package:gymshala/pages/food_calories/diet_plan.dart';
import 'package:gymshala/widgets/bottom_navbar.dart';
import 'package:gymshala/widgets/countdown_days.dart';





class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    int totalDays = 365;
  int remainingDays = 35;
  Timer? _timer;
  
  final foodcontroller = Get.put(FoodController());
  final noticecontroller = Get.put(NoticeController());
  final bannercontroller = Get.put(BannerController());
  final bancont = Get.put(BannerkoController());
 
 
  final List<String> imageUrls = [ 
    'https://img.freepik.com/free-photo/muscular-man-doing-push-ups-one-hand_7502-4775.jpg',
    'https://img.freepik.com/premium-photo/shirtless-man-flipping-heavy-tire_136403-904.jpg',
    'https://t4.ftcdn.net/jpg/02/07/90/87/360_F_207908753_IgTqqhNJMOnWOgSNLXayj6MYaj91gdjp.jpg'
    
     ];

@override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      setState(() {
        if (remainingDays > 0) {
          remainingDays--;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }


@override
Widget build(BuildContext context) {
  double percentage = (remainingDays / totalDays);
    int progress = (percentage * 100).floor();
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
                
Padding(
  padding: const EdgeInsets.only(top: 25),
  child: CarouselSlider.builder(
    itemCount: bannercontroller.banners.length,
    itemBuilder: (context, index, realIndex) {
  String imageUrl = imageUrls[index % imageUrls.length];
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      width: Get.width - 40,
      placeholder: (context, url) => const CircularProgressIndicator(),
    ),
  );
},

    options: CarouselOptions(
      enlargeCenterPage: true,
      autoPlay: true,
      aspectRatio: 16 / 7,
      autoPlayCurve: Curves.fastOutSlowIn,
      enableInfiniteScroll: true,
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      viewportFraction: 0.68,
    ),
  ),
),

Padding(
  padding: const EdgeInsets.only(top: 216,left: 3),
  child:  Container(
    height: Get.height/4.1,
    width: Get.width/2.5,
    child: Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text("Days Left",style: TextStyle(fontSize: 18),),
    
          SizedBox(height: 7,),
    
          CircularIndicator(
            percentage: percentage, 
            remainingDays: remainingDays,
             progress: progress
          ),
    
           SizedBox(height: 6,),
    
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFC1121F),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Change the value as per your need
                    ),
              
    
            ),
            onPressed: (){
    
            }, 
            child: Text("Pay in Advance")
          )
    
          
    
    
        ],
      ),
    ),
    

    
  ),
),




Padding(
  padding: const EdgeInsets.only(top: 220,left: 175),
  child:   Container(
    decoration: BoxDecoration(
      color: const Color(0xFFC1121F),
      borderRadius: BorderRadius.circular(10)

    ),
    height: Get.height/4.3,
    width: Get.width/1.8,
  
    
  
    child: 
    SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 5,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: const [
              SizedBox(width: 7,),
              Icon(Icons.campaign,color: Colors.white,size: 25,),
               SizedBox(width: 20,),
    
              Text("Gym Admin",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: Colors.white),),
            ],
          ),
          const SizedBox(height: 20,),
    
    
        Padding(
  padding: const EdgeInsets.only(left: 10, right: 10),
  child: Obx(() {
    if (noticecontroller.notices.isNotEmpty) {
      // Access the description of the last notice in the list
      String lastNoticeDescription =
          noticecontroller.notices.last.description ?? '';
      return Text(lastNoticeDescription,
          style: const TextStyle(color: Colors.white, fontSize: 16));
    } else {
      return const SizedBox.shrink();
    }
  }),
),


          
          

         
          
        ],
      ),
    )

  ),
),


           

 ],
 ),
 SizedBox(height: 32,),

Container(
                              height: 175,
                              width: Get.width/1.32,
                               decoration: BoxDecoration(
                                  image: DecorationImage(
                                  image: AssetImage('assets/images/home.png'),
                                  fit: BoxFit.cover
                                ),
                            ),
                          
                            ),
             
          ],
        ),
      ),
    ),
   

    bottomNavigationBar: AppBottomNavigationBar(selectedIndex: 0),


  );
}
}