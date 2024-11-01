import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:summer1/view/auth/login_screen.dart';
import 'package:summer1/view/details_screen.dart';
import 'package:summer1/view/widgets/Custom_button.dart';
import 'package:summer1/view/widgets/Custom_text.dart';
import 'package:summer1/view_model/control_view_model.dart';
import 'package:summer1/view_model/home_view_model.dart';

class homeScreen extends StatelessWidget {
  final List<String> names = <String>[
    's',
    's',
    's',
    's',
  ];
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.put(HomeViewModel()),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                  child: Column(
                    children: [
                      _searchTextFormField(),
                      const SizedBox(
                        height: 20,
                      ),
                      const CustomText(
                        text: 'Categories',
                        alignment: Alignment.topLeft,
                        fontsize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _listViewCategory(),
                      const SizedBox(
                        height: 40,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Best selling',
                            fontWeight: FontWeight.bold,
                            fontsize: 22,
                          ),
                          CustomText(
                            text: 'See all',
                            fontWeight: FontWeight.bold,
                            fontsize: 22,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      _listViewProducts(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade400),
      child: TextFormField(
        decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              size: 30,
            )),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            height: 20,
            width: 20,
          ),
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, index) {
            return Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade200),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child:
                          Image.network(controller.categoryModel[index].image),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Text(controller.categoryModel[index].name),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 350,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            width: 20,
          ),
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(
                    () => DetailsScreen(model: controller.productModel[index]));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 41, 32, 32)),
                      width: MediaQuery.of(context).size.width * .4,
                      child: Container(
                        child: Image.network(
                          controller.productModel[index].image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: controller.productModel[index].name,
                      alignment: Alignment.bottomLeft,
                      fontsize: 18,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: CustomText(
                        text: controller.productModel[index].description,
                        alignment: Alignment.bottomLeft,
                        color: Colors.grey,
                        fontsize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      text: controller.productModel[index].price + ' \$',
                      alignment: Alignment.bottomLeft,
                      color: Colors.green,
                      fontsize: 18,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
