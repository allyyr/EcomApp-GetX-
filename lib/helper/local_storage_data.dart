import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:summer1/constance.dart';
import 'package:summer1/model/User_model.dart';

class LocalStorageData extends GetxController {
  Future<UserModel?> get getUser async {
    try {
      UserModel userModel = await getUserData();
      if (userModel == null) {
        return null;
      }
      return userModel;
    } catch (e) {
      print(e.toString());
    }
  }

  getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString(CACHED_USER_DATA);
    if (value != null) {
      return UserModel.fromJson(jsonDecode(value));
    }
    return print("mochkil rah hna null");
  }

  setUser(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(CACHED_USER_DATA, json.encode(UserModel().toJson()));
  }

  void deleteUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
