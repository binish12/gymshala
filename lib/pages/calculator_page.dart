import 'package:flutter/material.dart';
import 'package:gymshala/pages/calorie_calculator/home_screen.dart';
import 'package:gymshala/pages/food_calories/food_page.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SizedBox(
          height: kToolbarHeight,
          child: TabBar(
            labelStyle: TextStyle(fontSize: 20),
            controller: _tabController,
            tabs: const [
              Tab(text: 'Body'),
              Tab(text: 'Food',),
              
            ],
          ),
        ),
        
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          HomeScreen(),
          FoodPage(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
