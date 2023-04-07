import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymshala/controllers/workout_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/bottom_navbar.dart';





final workoutcontroller = Get.put(WorkoutController());




class WorkoutPage extends StatelessWidget {
  const WorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(

          

        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 150,top: 200),
          child: Container(
            child: Column(children: [

              ElevatedButton(
                onPressed: () async {
                  
                  final pdfUrl = await workoutcontroller.getPdf(fileID: 7);
                  var bin = pdfUrl;
                  print(bin);
                  await launchInBrowser(bin.toString());
                 
                  
                },

              child: Text("Push Pull Leg Split"),


              )
            ]),
       
     
            
          

            

          ),
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