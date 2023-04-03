import 'package:get/get.dart';

class ActivityController extends GetxController{
 var selectedActivity = "".obs;

 onChangeActivity (var activity){
  selectedActivity.value = activity;
 }

 

}