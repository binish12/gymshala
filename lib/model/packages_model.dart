List<Package> packagesFromJson(
        List<dynamic> packagesJson) =>
    List<Package>.from(packagesJson.map((packagesJson) =>
        Package.fromJson(packagesJson)));
class Package {
  String? packageName;
  String? description;
  String? amount;

  Package({this.packageName, this.description, this.amount});

  Package.fromJson(Map<String, dynamic> json) {
    packageName = json['package_name'];
    description = json['description'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['package_name'] = this.packageName;
    data['description'] = this.description;
    data['amount'] = this.amount;
    return data;
  }
}