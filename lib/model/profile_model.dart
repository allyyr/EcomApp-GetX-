import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:summer1/helper/local_storage_data.dart';
import 'package:summer1/model/User_model.dart';

class ProfileModel extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentUser();
  }

  final LocalStorageData localStorageData = Get.find();

  UserModel? get userModel => _usermodel;
  UserModel? _usermodel;

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }

  void getCurrentUser() async {
    await localStorageData.getUser.then((onValue) {
      _usermodel = onValue!;
    });
    update();
  }
}
