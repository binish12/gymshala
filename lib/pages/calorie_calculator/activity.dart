
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymshala/controllers/activity_controller.dart';

class ActivitySelection extends StatelessWidget {
  ActivityController activityController = Get.put(ActivityController());
  
  
  ActivitySelection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            
            children: [
            Text("Physical Activity Level",style: TextStyle(fontSize: 25,color: Colors.grey),),

          ],),
        ),
        SizedBox(height: 10,),
        
        Row(
          children: [
            
            Obx(() => Radio(
                value: "1",
                groupValue: activityController.selectedActivity.value,
                onChanged: (value) {
                  activityController.onChangeActivity(value);
                })),
            Text(
              "Little or no exercise",
              style: TextStyle(fontSize: 22),
            )
          ],
        ),
        Row(
          children: [
            Obx(() => Radio(
                value: "2",
                groupValue: activityController.selectedActivity.value,
                onChanged: (value) {
                  activityController.onChangeActivity(value);
                })),
            Text(
              "Exercise 1-3 times a week",
              style: TextStyle(fontSize: 22),
            )
          ],
        ),
        Row(
          children: [
            Obx(() => Radio(
                value: "3",
                groupValue: activityController.selectedActivity.value,
                onChanged: (value) {
                  activityController.onChangeActivity(value);
                })),
            Text(
              "Hard exercise 3-5 times a week",
              style: TextStyle(fontSize: 22),
            )
          ],
        ),
        Row(
          children: [
            Obx(() => Radio(
                value: "4",
                groupValue: activityController.selectedActivity.value,
                onChanged: (value) {
                  activityController.onChangeActivity(value);
                })),
            Text(
              "Intense exercise 6-7 times a week",
              style: TextStyle(fontSize: 22),
            )
          ],
        ),
        Row(
          children: [
            Obx(() => Radio(
                value: "5",
                groupValue: activityController.selectedActivity.value,
                onChanged: (value) {
                  activityController.onChangeActivity(value);
                })),
            Text(
              "Professional Athlete",
              style: TextStyle(fontSize: 22),
            )
          ],
        ),

      ]),
    );
  }
}
