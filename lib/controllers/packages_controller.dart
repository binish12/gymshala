import 'dart:developer';


import 'package:get/get.dart';
import '../model/packages_model.dart';
import '../repo/packages_repo.dart';

class PackageController extends GetxController {
  RxList<Package> packages = RxList();
  Rx<Package?> selectedPackage = Rx<Package?>(null);

  RxBool loading = false.obs;


  @override
  void onInit() {
    getAllPackages();
    super.onInit();
  }

  getAllPackages() async {
    loading.value = true;
    await PackageRepo.getPackage(
      onSuccess: (package) {
        loading.value = false;
        packages.addAll(package);
       
      },
      onError: ((message) {
        loading.value = false;
        log("error ");
      }),
    );
  }
}