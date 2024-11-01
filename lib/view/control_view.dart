import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:summer1/view/Cart_view.dart';
import 'package:summer1/view/auth/login_screen.dart';
import 'package:summer1/view/home_view.dart';
import 'package:summer1/view/profile_view.dart';
import 'package:summer1/view_model/auth_view_model.dart';
import 'package:summer1/view_model/control_view_model.dart';

class ControllView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<ControlViewModel>(
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text('Explore'),
              ),
              label: '',
              icon: Image.asset(
                'images/Icon_Explore.png',
                fit: BoxFit.contain,
                width: 20,
              )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text('Cart'),
              ),
              label: '',
              icon: Image.asset(
                'images/Icon_Cart.png',
                fit: BoxFit.contain,
                width: 20,
              )),
          BottomNavigationBarItem(
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text('Profile'),
              ),
              label: '',
              icon: Image.asset(
                'images/Icon_User.png',
                fit: BoxFit.contain,
                width: 20,
              )),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (value) {
          controller.changeSelectedValue(value);
        },
        elevation: 0,
        selectedItemColor: Colors.black,
        backgroundColor: Colors.grey.shade50,
      ),
    );
  }
}
