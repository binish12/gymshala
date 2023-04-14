import '../api.dart';

List<BannerPics> bannerFromJson(
        List<dynamic> bannerJson) =>
    List<BannerPics>.from(bannerJson.map((bannerJson) =>
        BannerPics.fromJson(bannerJson)));
class BannerPics {
  bool? success;
  List<String>? data;
  String? message;
  String? imagePath;

  BannerPics({this.success, this.data, this.message});

  BannerPics.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'].cast<String>();
    message = json['message'];
    if (data != null && data!.isNotEmpty) {
      imagePath = "${baseUrl}${data![0]}";
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['data'] = this.data;
    data['message'] = this.message;
    return data;
  }
}
