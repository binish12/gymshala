import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:gymshala/pages/food_calories/total_display.dart';

import '../../controllers/foods_controller.dart';
import '../../model/foods_model.dart';
import 'food_info.dart';

class DietPlan extends StatefulWidget {
  const DietPlan({super.key});

  @override
  State<DietPlan> createState() => _DietPlanState();
}

class _DietPlanState extends State<DietPlan> {
    TextEditingController searchController = TextEditingController();
  final foodController = Get.put(FoodController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(),

      body: SingleChildScrollView(
        child: Column(
              children: [
                SizedBox(height: 20,),
                
                const Text(
                  "Food List",
                  style: TextStyle(fontSize: 26,fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: Get.width/1.01,
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                     
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onChanged: (query) {
                      foodController.updateFilteredFoods(query);
                      foodController.filteredFoods.refresh();
                    },
                  ),
                ),
                Obx(() => ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: foodController.filteredFoods.length,
                                itemBuilder: (context, index) {
                                  Food food = foodController.filteredFoods[index];
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          onTap: () {
                                            showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        String inputText = "";
                                        String hint = "Enter weight in gram :";
                                        
                                        return AlertDialog(
                                          title:  Text(hint),
                                          
                                          content: TextField(
                                            keyboardType: TextInputType.number,
                                             inputFormatters: <TextInputFormatter>[
                                              FilteringTextInputFormatter.digitsOnly
                                            ],
                                            
                                            onChanged: (text) {
                                              inputText = text;
                                            },
                                            
                                          ),
                                          
                                          actions: [
                
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context); // close the dialog
                
                                               
                                              },
                                              child: const Text("Cancel"),
                                            ),
                                            
                                            TextButton(
                                              onPressed: () {
                
                                                if(inputText != "" ){
                                                  Get.to(() => TotalDisplay(
                                                  totalCalories: food.totalCalories ?? '',
                                                  quantity: food.quantity ?? '',
                                                  carbohydrates: food.carbohydrates ?? '',
                                                  fats: food.fats ?? '',
                                                  protein: food.protein ?? '',
                                                  selectedQuantity: inputText 
                                                ));
                                                
                                                }
                
                                                else{
                                                  hint = "input";
                                    


                                  }


                                },
                                child: const Text("Add"),
                              ),


                              

                              
                            ],
                            
                          );
                          
                        },
                      );
                              
                            },
                            title: Text(
                              food.foodName ?? "",
                              style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                )
              ],
            ),
      ),








    );
  }
}