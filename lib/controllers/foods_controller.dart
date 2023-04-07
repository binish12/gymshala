import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gymshala/model/foods_model.dart';
import 'package:gymshala/pages/food_calories/food_info.dart';
import '../repo/food_repo.dart';

class FoodController extends GetxController {
  RxList<Food> foods = RxList();
  RxList<Food> filteredFoods = RxList();
  RxBool loading = false.obs;
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    getAllFoods();
    super.onInit();
  }

  getAllFoods() async {
    loading.value = true;
    await FoodRepo.getFood(
      onSuccess: (food) {
        loading.value = false;
        foods.addAll(food);
        filteredFoods.addAll(food);
      },
      onError: ((message) {
        loading.value = false;
        log("error ");
      }),
    );
  }

  void updateFilteredFoods(String query) {
    if (query.isEmpty) {
      filteredFoods.assignAll(foods);
    } else {
      filteredFoods.assignAll(foods.where((food) {
        final foodName = food.foodName?.toLowerCase() ?? "";
        final queryLowercase = query.toLowerCase();
        filteredFoods.refresh();
        return foodName.contains(queryLowercase);
      }));
    }
  }

//   getBottomSheet() {
//     Get.bottomSheet(
//       backgroundColor: Color.fromARGB(255, 255, 255, 255),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(25),
//         side: const BorderSide(
//           color: Colors.white,
//           style: BorderStyle.solid,
//           width: 2,
//         ),
//       ),
//       SizedBox(
//         height: Get.height / 2.5,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               const Text(
//                 "Food List",
//                 style: TextStyle(fontSize: 25),
//               ),
//               SizedBox(
//                 width: Get.width/1.01,
//                 child: TextField(
//                   controller: searchController,
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.search),
                   
//                     hintText: "Search",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                   ),
//                   onChanged: (query) {
//                     updateFilteredFoods(query);
//                     filteredFoods.refresh();
//                   },
//                 ),
//               ),
//               Obx(() => ListView.builder(
//                               physics: const NeverScrollableScrollPhysics(),
//                               shrinkWrap: true,
//                               itemCount: filteredFoods.length,
//                               itemBuilder: (context, index) {
//                                 Food food = filteredFoods[index];
//                                 return Padding(
//                                   padding: const EdgeInsets.only(top: 10),
//                                   child: Column(
//                                     children: [
//                                       ListTile(
//                                         onTap: () {
//                                           showDialog(
//                                     context: context,
//                                     builder: (BuildContext context) {
//                                       String inputText = "";
//                                       String hint = "Enter weight in gram :";
                                      
//                                       return AlertDialog(
//                                         title:  Text(hint),
                                        
//                                         content: TextField(
//                                           keyboardType: TextInputType.number,
//                                            inputFormatters: <TextInputFormatter>[
//                                             FilteringTextInputFormatter.digitsOnly
//                                           ],
                                          
//                                           onChanged: (text) {
//                                             inputText = text;
//                                           },
                                          
//                                         ),
                                        
//                                         actions: [
              
//                                           TextButton(
//                                             onPressed: () {
//                                               Navigator.pop(context); // close the dialog
              
                                             
//                                             },
//                                             child: const Text("Cancel"),
//                                           ),
                                          
//                                           TextButton(
//                                             onPressed: () {
              
//                                               if(inputText != "" ){
//                                                 Get.to(() => FOODInfo(
//                                                 totalCalories: food.totalCalories ?? '',
//                                                 quantity: food.quantity ?? '',
//                                                 carbohydrates: food.carbohydrates ?? '',
//                                                 fats: food.fats ?? '',
//                                                 protein: food.protein ?? '',
//                                                 selectedQuantity: inputText 
//                                               ));
                                              
//                                               }
              
//                                               else{
//                                                 hint = "input";
                                  


//                                 }


//                               },
//                               child: const Text("OK"),
//                             ),


                            

                            
//                           ],
                          
//                         );
                        
//                       },
//                     );
                            
//                           },
//                           title: Text(
//                             food.foodName ?? "",
//                             style: const TextStyle(
//                               color: Color.fromARGB(255, 0, 0, 0),
//                               fontWeight: FontWeight.bold,
//                               fontSize: 19,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:gymshala/model/foods_model.dart';
// import 'package:gymshala/pages/food_calories/food_info.dart';

// import '../repo/food_repo.dart';


// class FoodController extends GetxController {
//   RxList<Food> foods = RxList();
//   RxBool loading = false.obs;
//   TextEditingController searchController = TextEditingController();
//   @override
//   void onInit() {
//     getAllFoods();
//     super.onInit();
//   }

//   getAllFoods() async {
//     loading.value = true;
//     await FoodRepo.getFood(
//       onSuccess: (food) {
//         loading.value = false;

//         foods.addAll(food);
//       },
//       onError: ((message) {
//         loading.value = false;
//         log("error ");
//       }),
//     );
//   }

//   List<Food> getFilteredFoods(String query) {
//     return foods.where((food) {
//       final foodName = food.foodName?.toLowerCase() ?? "";
//       final queryLowercase = query.toLowerCase();
//       return foodName.contains(queryLowercase);
//     }).toList();
//   }

//   getBottomSheet(){
//         Get.bottomSheet(
//         backgroundColor: Colors.lightBlue, 
        
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25),
//                       side: const BorderSide(
//                         color: Colors.white,
//                         style: BorderStyle.solid,
//                         width: 2,
//                       )
//                     ),

//                     SizedBox(
//                       height: Get.height/2.5,
                      
//                       child: SingleChildScrollView(
//                         child: Column(
//                           children:  [
//                             const Text("Food List",style: TextStyle(fontSize: 25),),

//                             TextField(
                              
//                               controller: searchController,
//                               decoration:  InputDecoration(
//                                 hintText: "Search",
//                                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//                               ),
//                               onChanged: (query) {
//                                 final filteredFoods = getFilteredFoods(query);
//                                 foods.clear();
//                                 foods.addAll(filteredFoods);
//                               },
//                             ),

//                             ListView.builder(
//                               physics: const NeverScrollableScrollPhysics(),
//                             shrinkWrap: true,
//                             itemCount: foods.length,
//                             itemBuilder: (context,index){ Food food = foods[index];
                           
//                                 return  Padding(
//                                   padding: const EdgeInsets.only(top: 10),
//                                   child: Column(
//                                     children: [
//                                       ListTile(
//                                           onTap: () {
//                                             Get.to(FOODInfo(totalCalories: food.totalCalories??'',quantity: food.quantity??'',carbohydrates: food.carbohydrates??'',fats: food.fats??'',protein: food.protein??''));
                                            
//                                           },
//                                           title: Text(food.foodName??"",
//                                                     style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontWeight:FontWeight.bold,fontSize: 19),),
                                          
                                          
                                          


//                             ),
//                   ],
//                 ),
//               );
       
//             }
//           ),
//                           ],
//                         ),
//                       ),

//                     ),
                  
//                   );
//   }
// }
}