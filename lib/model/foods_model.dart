List<Food> foodsFromJson(
        List<dynamic> foodsJson) =>
    List<Food>.from(foodsJson.map((foodsJson) =>
        Food.fromJson(foodsJson)));
class Food {
  String? foodName;
  String? quantity;
  String? totalCalories;
  String? carbohydrates;
  String? fats;
  String? protein;

  Food(
      {this.foodName,
      this.quantity,
      this.totalCalories,
      this.carbohydrates,
      this.fats,
      this.protein});

  Food.fromJson(Map<String, dynamic> json) {
    foodName = json['food_name'];
    quantity = json['quantity'];
    totalCalories = json['total_calories'];
    carbohydrates = json['carbohydrates'];
    fats = json['fats'];
    protein = json['protein'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['food_name'] = this.foodName;
    data['quantity'] = this.quantity;
    data['total_calories'] = this.totalCalories;
    data['carbohydrates'] = this.carbohydrates;
    data['fats'] = this.fats;
    data['protein'] = this.protein;
    return data;
  }
}