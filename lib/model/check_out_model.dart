import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:summer1/constance.dart';
import 'package:summer1/view/control_view.dart';

class CheckOutModel extends GetxController {
  int get index => _index;
  int _index = 0;
  Pages get pages => _pages;
  Pages _pages = Pages.deliveryTime;

  void changeIndex(int i) {
    _index = i;
    if (_index == 1) {
      _pages = Pages.addAddress;
    } else if (_index == 2) {
      _pages = Pages.summary;
    } else if (_index == 3) {
      Get.to(ControllView());
    }
    update();
  }

  Color getColor(int i) {
    if (i == _index) {
      return inProgressColor;
    } else if (index < index) {
      return Colors.teal;
    } else {
      return todoColor;
    }
  }
}
