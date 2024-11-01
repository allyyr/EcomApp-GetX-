import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summer1/helper/binding.dart';
import 'package:summer1/view/auth/login_screen.dart';
import 'package:summer1/view/cart_viewmodel.dart';
import 'package:summer1/view/control_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      home: ControllView(),
      theme: ThemeData(fontFamily: 'fontsfordetails'),
    );
  }
}
