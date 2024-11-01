import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:summer1/model/User_model.dart';

class FirestoreUser {
  final CollectionReference _usercCollection =
      FirebaseFirestore.instance.collection('Users');
  Future<void> addUserToFirestore(UserModel userModel) async {
    return await _usercCollection.doc(userModel.userId).set(userModel.toJson());
  }

  Future<DocumentSnapshot?> getCurrentUser(String uid) async {
    return await _usercCollection.doc(uid).get();
  }
}
