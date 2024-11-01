import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:summer1/constance.dart';
import 'package:summer1/view/cart_viewModel.dart';
import 'package:summer1/view/checkout/add_address.dart';
import 'package:summer1/view/checkout/check_out_view.dart';
import 'package:summer1/view/checkout/summary.dart';
import 'package:summer1/view/widgets/Custom_button.dart';
import 'package:summer1/view/widgets/Custom_text.dart';

class CartView extends StatelessWidget {
  CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewmodel>(
        init: Get.put(CartViewmodel()), // Explicitly put here
        builder: (controller) => Scaffold(
              body: controller.cartProductModel.length == 0
                  ? Padding(
                      padding: const EdgeInsets.all(80),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'images/emptyCart.svg',
                            width: 200,
                            height: 200,
                          ),
                          CustomText(
                            text: 'Empty cart',
                          ),
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: Container(
                              child: ListView.separated(
                            itemBuilder: (context, index) {
                              return Container(
                                child: Row(
                                  children: [
                                    Container(
                                      height: 160,
                                      child: Image.network(
                                        controller
                                            .cartProductModel[index].image,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                            text: controller
                                                .cartProductModel[index].name,
                                            fontsize: 18,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          CustomText(
                                            color: primaryColor,
                                            text:
                                                '\$${controller.cartProductModel[index].price.toString()}',
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: 140,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .increaseQuantity(
                                                              index);
                                                    },
                                                    child:
                                                        const Icon(Icons.add)),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                CustomText(
                                                  text: controller
                                                      .cartProductModel[index]
                                                      .quantity
                                                      .toString(),
                                                  fontsize: 20,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 15),
                                                    child: GestureDetector(
                                                        onTap: () {
                                                          controller
                                                              .decreaseQuantity(
                                                                  index);
                                                        },
                                                        child: const Icon(
                                                            Icons.minimize)))
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount: controller.cartProductModel.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 15,
                              );
                            },
                          )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  CustomText(
                                      text: 'Total',
                                      fontsize: 22,
                                      color: Colors.grey),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  GetBuilder<CartViewmodel>(
                                    init: CartViewmodel(),
                                    builder: (controller) => CustomText(
                                      text: '\$ ${controller.totalPrice}',
                                      color: primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 100,
                                width: 150,
                                child: CustomButton(
                                  onpressed: () {
                                    Get.to(() => AddAddress());
                                  },
                                  text: 'Checkout',
                                  colorbutton: primaryColor,
                                  fontcolor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ));
  }
}
