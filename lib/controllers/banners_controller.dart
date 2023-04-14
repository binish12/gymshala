import 'dart:developer';

import 'package:get/get.dart';
import 'package:gymshala/api.dart';

import '../model/banners_model.dart';
import '../repo/banner_repo.dart';

class BannerController extends GetxController {

  RxInt unreadCount = RxInt(0);
  RxList<BannerPics> banners = <BannerPics>[].obs;
  RxBool loading = false.obs;
  
  @override
  void onInit() {
    getAllBanners();
    super.onInit();
  }

  getAllBanners() async {
    loading.value = true;
    await BannerRepo.getBanner(
      onSuccess: (banner) {
        loading.value = false;

        banners.addAll(banner);
        print([banners[0].data]);
      },
      onError: ((message) {
        loading.value = false;
        log("error ");
      }),
    );
  }
}
