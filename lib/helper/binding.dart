import 'package:get/get.dart';
import 'package:summer1/helper/local_storage_data.dart';
import 'package:summer1/model/check_out_model.dart';
import 'package:summer1/view/cart_viewModel.dart';
import 'package:summer1/view_model/auth_view_model.dart';
import 'package:summer1/view_model/control_view_model.dart';
import 'package:summer1/view_model/home_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    print("Initializing dependencies...");
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewmodel());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => CheckOutModel());
  }
}
