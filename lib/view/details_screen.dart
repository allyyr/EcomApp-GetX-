import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summer1/model/cart_product_model.dart';
import 'package:summer1/model/product_model.dart';
import 'package:summer1/view/cart_viewModel.dart';
import 'package:summer1/view/widgets/Custom_button.dart';
import 'package:summer1/view/widgets/Custom_text.dart';

class DetailsScreen extends StatelessWidget {
  ProductModel model;
  DetailsScreen({required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        //Set your desired title here
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              height: 280,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                model.image,
                fit: BoxFit.fill,
              ),
            ),
            // SizedBox(
            //   height: 26,
            // ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      CustomText(
                        text: model.name,
                        fontsize: 20,
                        alignment: Alignment.centerLeft,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15),
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomText(
                                  text: 'Size',
                                ),
                                CustomText(text: model.sized),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomText(
                                  text: 'Color',
                                ),
                                Container(
                                  height: 20,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(15),
                                    color: model.color,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomText(
                        text: 'details',
                        fontsize: 20,
                        alignment: Alignment.centerLeft,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: model.description,
                        fontsize: 16,
                        alignment: Alignment.centerLeft,
                        height: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(
                        text: 'Price',
                        fontsize: 22,
                      ),
                      CustomText(
                        text: model.price + '\$',
                        color: Colors.green,
                      ),
                    ],
                  ),
                  GetBuilder<CartViewmodel>(
                    init: Get.put(CartViewmodel()), // Explicitly put here
                    builder: (controller) => Container(
                      width: 180,
                      height: 100,
                      padding: EdgeInsets.all(20),
                      child: CustomButton(
                        text: 'Add to card',
                        colorbutton: Colors.green,
                        fontcolor: Colors.white,
                        onpressed: () {
                          controller.addProduct(CartProductModel(
                              name: model.name,
                              image: model.image,
                              price: model.price,
                              quantity: 1,
                              productId: model.productId));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
