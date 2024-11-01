import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:summer1/view/Cart_view.dart';
import 'package:summer1/view/home_view.dart';
import 'package:summer1/view/profile_view.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;
  Widget _currentScreen = homeScreen();

  get navigatorValue => _navigatorValue;
  get currentScreen => _currentScreen;

  void changeSelectedValue(int selectValue) {
    _navigatorValue = selectValue;
    switch (selectValue) {
      case 0:
        {
          _currentScreen = homeScreen();
          break;
        }
      case 1:
        {
          _currentScreen = CartView();
          break;
        }
      case 2:
        {
          _currentScreen = ProfileView();
          break;
        }

      default:
    }
    update();
  }
}
