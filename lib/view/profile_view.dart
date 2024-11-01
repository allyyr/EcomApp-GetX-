import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summer1/view/widgets/Custom_text.dart';
import 'package:summer1/view/widgets/Custom_button.dart';
import 'package:summer1/model/profile_model.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileModel>(
      init: ProfileModel(),
      builder: (controller) => Scaffold(
        body: Container(
          padding: const EdgeInsets.only(top: 100),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.amber,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: controller.userModel?.pic == null ||
                                  controller.userModel?.pic == 'default'
                              ? const AssetImage('images/pfp.png')
                                  as ImageProvider
                              : NetworkImage(controller.userModel!.pic!),
                        ),
                      ),
                    ),
                    const Column(
                      children: [
                        CustomText(
                          text: 'ALI rougab',
                          fontsize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 14),
                        CustomText(text: 'ALI rougab@gmail.com'),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 120,
                ),
                SizedBox(
                  height: 450,
                  child: ListView(
                    padding: EdgeInsets.all(16),
                    children: [
                      _buildMenuItem(
                        icon: Icons.edit,
                        text: "Edit Profile",
                        onTap: () {},
                      ),
                      _buildMenuItem(
                        icon: Icons.location_on,
                        text: "Shipping Address",
                        onTap: () {
                          // Add navigation or action here
                        },
                      ),
                      _buildMenuItem(
                        icon: Icons.history,
                        text: "Order History",
                        onTap: () {
                          // Add navigation or action here
                        },
                      ),
                      _buildMenuItem(
                        icon: Icons.credit_card,
                        text: "Cards",
                        onTap: () {
                          // Add navigation or action here
                        },
                      ),
                      _buildMenuItem(
                        icon: Icons.notifications,
                        text: "Notifications",
                        onTap: () {
                          // Add navigation or action here
                        },
                      ),
                      _buildMenuItem(
                        icon: Icons.logout,
                        text: "Log Out",
                        onTap: () {
                          // Add log out functionality here
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
      {required IconData icon,
      required String text,
      required VoidCallback onTap}) {
    return ListTile(
      minVerticalPadding: 20,
      leading: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.green.shade50,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Colors.green),
      ),
      title: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
