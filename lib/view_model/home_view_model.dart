// ignore_for_file: prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:summer1/model/category_model.dart';
import 'package:summer1/model/product_model.dart';

import 'package:summer1/service/home_services.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CategoryModel> get categoryModel => _categoryModel;
  List<ProductModel> get productModel => _productModel;

  List<CategoryModel> _categoryModel = [];
  List<ProductModel> _productModel = [];
  HomeViewModel() {
    getCategory();
    GetBestSellingProducts();
  }

  getCategory() async {
    _loading.value = true;

    var onValue = await HomeServices().getCategory();

    for (var i = 0; i < onValue.length; i++) {
      // Cast the Firestore document data to a Map<String, dynamic>
      Map<dynamic, dynamic>? data = onValue[i].data() as Map<dynamic, dynamic>;

      // Check if the data is null or incomplete
      // Assuming CategoryModel has a fromJson constructor
      CategoryModel category = CategoryModel.fromJson(data);
      _categoryModel.add(category);
    }
    _loading.value = false;
    update();
  }

  // ignore: non_constant_identifier_names
  GetBestSellingProducts() async {
    _loading.value = true;

    var onValue = await HomeServices().getBestselling();

    for (var i = 0; i < onValue.length; i++) {
      // Cast the Firestore document data to a Map<String, dynamic>
      Map<dynamic, dynamic> data = onValue[i].data() as Map<dynamic, dynamic>;

      // Check if the data is null or incomplete
      // Assuming CategoryModel has a fromJson constructor
      ProductModel product = ProductModel.fromJson(data);
      _productModel.add(product);
    }
    _loading.value = false;
    update();
  }
}
