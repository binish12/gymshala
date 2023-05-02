import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/packages_model.dart';
import '../repo/packages_repo.dart';

class PackageController extends GetxController {
  RxList<Package> packages = RxList();
  RxList<Package> filteredPackages = RxList();
  RxBool loading = false.obs;
  TextEditingController searchController = TextEditingController();

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
        filteredPackages.addAll(package);
      },
      onError: ((message) {
        loading.value = false;
        log("error ");
      }),
    );
  }
}