import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gymshala/pages/calculator_page.dart';
import 'package:gymshala/pages/calorie_calculator/home_screen.dart';
import 'package:gymshala/pages/home_page.dart';
import 'package:gymshala/pages/profile_page/profile.dart';
import 'package:gymshala/pages/workout_pages/workout_page.dart';

class AppBottomNavigationBar extends StatefulWidget {
    int selectedIndex;
   AppBottomNavigationBar({super.key, required this.selectedIndex});

  @override
  _AppBottomNavigationBarState createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
    switch (index) {
      case 0:
        Get.offAll(const HomePage());
        break;
      case 1:
        Get.offAll(const CalculatorPage());
        break;
      case 2:
        Get.offAll(const WorkoutPage());
        break;
      case 3:
        Get.offAll(const MyProfile());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 32,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFFC1121F),
      unselectedItemColor: Colors.grey,
      currentIndex: widget.selectedIndex,
      onTap: _onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.calculator, size: 26.5,),
          label: 'Calculator',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center,),
          label: 'Workouts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
