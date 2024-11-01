import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summer1/view/auth/signup.dart';
import 'package:summer1/view/widgets/Custom_button.dart';
import 'package:summer1/view/widgets/Custom_text.dart';
import 'package:summer1/view/widgets/custom_text_form_field.dart';
import 'package:summer1/view_model/auth_view_model.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Welcome',
                    fontsize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  GestureDetector.new(
                    onTap: () {
                      Get.to(signup());
                    },
                    child: CustomText(
                      text: 'Sign up',
                      fontsize: 19,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
              const CustomText(
                text: 'Sign in to continue',
                fontWeight: FontWeight.w300,
                alignment: Alignment.topLeft,
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    text: 'Email',
                    hint: 'eeeeeeeee@gmail.com',
                    onsave: (value) {
                      controller.email = value!;
                    },
                    validation: (value) {
                      if (value == null) {
                        print('error');
                      }
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextFormField(
                    text: 'Password',
                    hint: '*******',
                    onsave: (value) {
                      controller.password = value!;
                    },
                    validation: (value) {
                      if (value == null) {
                        print('error');
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              CustomText(
                text: 'Forgot Password?',
                alignment: Alignment.centerRight,
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                text: 'login',
                colorbutton: Colors.green,
                fontcolor: Colors.white,
                onpressed: () {
                  _formkey.currentState!.save();
                  if (_formkey.currentState!.validate()) {
                    controller.signInWithEmailAndPassword();
                  }
                },
              ),
              SizedBox(
                height: 26,
              ),
              CustomText(
                text: '-OR-',
                fontsize: 18,
              ),
              SizedBox(
                height: 26,
              ),
              CustomButton(
                text: 'Sign in with google',
                imagepath: 'images/google.png',
                colorbutton: Colors.white,
                fontcolor: Colors.black,
                onpressed: () {
                  controller.googleSignInMethod();
                  // for ios there is reversed client id
                },
              ),
              SizedBox(
                height: 26,
              ),
              CustomButton(
                text: 'Sign in with facebook',
                imagepath: 'images/facebook.png',
                colorbutton: Colors.white,
                fontcolor: Colors.black,
                onpressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
