
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymshala/pages/calorie_calculator/home_screen.dart';
import 'package:gymshala/pages/home_page.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


class NewPage extends StatelessWidget {
  var maintain;
  var surplus;
  var deficit;
  
  
    NewPage(this.maintain,this.surplus,this.deficit, {super.key});
    
   
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (() {
            
            Get.offAll(HomePage());
          }),
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Calories",),
        titleSpacing: 167,
      ),
      body: 
      Padding(
        padding: const EdgeInsets.only(top: 30,),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  
                  children: [

                
                
                const Text('Your maintainance calorie is :',style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),

                //  SleekCircularSlider(
                  
                //   min: 1000,
                //   max: 5000,
                //   initialValue: maintain,
                //   appearance: CircularSliderAppearance(
                //   animationEnabled: false,
                //   infoProperties: InfoProperties(
                //     mainLabelStyle: TextStyle(color: Colors.amber,fontSize: 33),
                //     modifier: 

                //   )
                //   ),
                // ),

               SfRadialGauge(
                  enableLoadingAnimation: true,
                  axes: <RadialAxis>[
                  RadialAxis(minimum: 500, maximum: 10000,
                  ranges: <GaugeRange>[
                  GaugeRange(startValue: 500, endValue: 2375, color:Colors.green),
                  GaugeRange(startValue: 2375,endValue: 4750,color: Color.fromARGB(255, 209, 209, 6)),
                  GaugeRange(startValue: 4750,endValue: 7125,color: Color.fromARGB(255, 0, 58, 219)),
                  GaugeRange(startValue: 7125,endValue: 10000,color: Colors.red)],
                  pointers: <GaugePointer>[
                  NeedlePointer(value: maintain,enableAnimation: true,)],
                  annotations: <GaugeAnnotation>[
                  GaugeAnnotation(widget: Container(child: 
                   Text('$maintain \n    KCAL',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,
                   color: Color.fromARGB(255, 255, 136, 0),
                   shadows: <Shadow>[Shadow(color: Colors.black,blurRadius: 2.5)]))),
                   angle: 90, positionFactor: 0.5

                  )]

                )]),

                ],
                ),
              ),
              

            Text('For weight gain / Calorie surplus : $surplus',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text('For weight loss / Calorie deficit : $deficit',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 71,),

            Center(
              child: SizedBox(
                height: 48,
                width: double.infinity,
                child: ElevatedButton(
                  
                  style: ElevatedButton.styleFrom(
                    elevation: 4,
                  ),
                      onPressed: () {
                        Get.offAll(const HomeScreen());
                      },
                      child: const Text("Re-calculate",style: TextStyle(fontSize: 23),),

                    ),
              ),
            ),

            
              
            ],
          ),
        ),
      ),
    );
  }
}