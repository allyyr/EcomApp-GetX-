import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summer1/view/auth/login_screen.dart';
import 'package:summer1/view/auth/signup.dart';
import 'package:summer1/view/widgets/Custom_button.dart';
import 'package:summer1/view/widgets/Custom_text.dart';
import 'package:summer1/view/widgets/custom_text_form_field.dart';
import 'package:summer1/view_model/auth_view_model.dart';

class signup extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.offAll(LoginScreen());
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
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
                    text: 'SignUp',
                    fontsize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    text: 'Name',
                    hint: 'Mohammed',
                    onsave: (value) {
                      controller.name = value!;
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
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                text: 'SignUp',
                colorbutton: Colors.green,
                fontcolor: Colors.white,
                onpressed: () {
                  _formkey.currentState!.save();
                  if (_formkey.currentState!.validate()) {
                    controller.createUserWithEmailAndPassword();
                  }
                },
              ),
              SizedBox(
                height: 26,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
