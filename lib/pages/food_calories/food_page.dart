import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:gymshala/controllers/foods_controller.dart';

import '../../model/foods_model.dart';
import 'food_info.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  TextEditingController searchController = TextEditingController();
  final foodController = Get.put(FoodController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                                  Get.to(() => FOODInfo(
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
                                child: const Text("OK"),
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