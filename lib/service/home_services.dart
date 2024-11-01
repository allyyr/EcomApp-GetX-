import 'package:cloud_firestore/cloud_firestore.dart';

class HomeServices {
  final CollectionReference _categoryReference =
      FirebaseFirestore.instance.collection('categories');
  final CollectionReference _productReference =
      FirebaseFirestore.instance.collection('products');

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryReference.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getBestselling() async {
    var value = await _productReference.get();
    return value.docs;
  }
}
