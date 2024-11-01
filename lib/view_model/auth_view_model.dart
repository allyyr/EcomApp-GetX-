import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:summer1/helper/local_storage_data.dart';
import 'package:summer1/model/User_model.dart';
import 'package:summer1/service/firestore_user.dart';
import 'package:summer1/view/control_view.dart';
import 'package:summer1/view/home_view.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String email, password, name;
  final LocalStorageData localStorageData = Get.find();
  Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;

  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  Future<void> googleSignInMethod() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // The user canceled the sign-in
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      await _auth.signInWithCredential(credential).then((user) {
        saveUser(user);
      });
      Get.offAll(() => ControllView());
    } catch (e) {
      print(e);
      Get.snackbar("Error", "Google sign-in failed. Please try again.");
    }
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await FirestoreUser().getCurrentUser(value.user!.uid).then((value) {
          setUser(UserModel.fromJson(value?.data() as Map<String, dynamic>));
        });
      });
      Get.offAll(() => ControllView());
    } catch (e) {
      print(e);
      Get.snackbar("Error", "Email sign-in failed. Please try again.");
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
      });

      Get.offAll(() => ControllView());
    } catch (e) {
      print(e);
      Get.snackbar("Error", "Email sign-in failed. Please try again.");
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user?.uid,
      email: user.user?.email,
      name: name == null ? user.user?.displayName : name,
      pic: '',
    );
    await FirestoreUser().addUserToFirestore(userModel);
    setUser(userModel);
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }
}
