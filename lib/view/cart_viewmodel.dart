import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:summer1/model/cart_product_model.dart';
import 'package:summer1/service/database/cart_database_helper.dart';

class CartViewmodel extends GetxController {
  ValueNotifier<bool> get loading => _loading;

  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;
  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;
  var dbHelper = CartDatabaseHelper.db;

  CartViewmodel() {
    getAllProduct();
  }

  getAllProduct() async {
    _loading.value = true;
    _cartProductModel = await dbHelper.getAllProduct();
    print('dddddddddd  ${_cartProductModel.length}');
    _loading.value = false;
    getTotalPrice();

    update();
  }

  addProduct(CartProductModel cartProductModel) async {
    bool exists =
        _cartProductModel.any((p) => p.productId == cartProductModel.productId);
    if (!exists) {
      await CartDatabaseHelper.db.insert(cartProductModel);
      _cartProductModel.add(cartProductModel);

      // add to local list
      getTotalPrice(); // update total price
      update(); // refresh UI
    }
  }

  getTotalPrice() {
    for (var i = 0; i < _cartProductModel.length; i++) {
      _totalPrice += (double.parse(_cartProductModel[i].price) *
          _cartProductModel[i].quantity);
    }
    print(_totalPrice);
    update();
  }

  increaseQuantity(int index) async {
    _cartProductModel[index].quantity++;
    _totalPrice += (double.parse(_cartProductModel[index].price));
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  decreaseQuantity(int index) async {
    _cartProductModel[index].quantity--;
    _totalPrice -= (double.parse(_cartProductModel[index].price));
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }
}
