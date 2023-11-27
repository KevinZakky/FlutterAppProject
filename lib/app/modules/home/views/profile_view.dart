import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul2/app/modules/home/controllers/AuthenticationController.dart';
import 'package:modul2/app/modules/home/controllers/auth_controller.dart';
import 'package:modul2/app/modules/home/views/web_view.dart';

class ProfileView extends StatelessWidget {
  final AuthenticationController authenticationController =
      Get.find<AuthenticationController>();

  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Settings",
          style: TextStyle(
            fontSize: 34,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin:
                const EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                authenticationController.profileImage == null
                    ? const CircleAvatar(
                        backgroundImage: AssetImage('lib/images/people.jpg'),
                        radius: 50,
                        backgroundColor: Colors.black,
                      )
                    : Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(
                                authenticationController.profileImage!),
                          ),
                        ),
                      ),
                const SizedBox(width: 20), // Spasi antara foto profil dan nama
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kevin',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'kevin@yahoo.com',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () async {
                  await authenticationController.pickImageFileFromGallery();
                },
                padding: EdgeInsets.only(left: 30),
                icon: const Icon(
                  Icons.image_outlined,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () async {
                  await authenticationController.captureImageFromPhoneCamera();
                },
                padding: EdgeInsets.only(left: 15),
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ],
          ),
          Container(
            margin:
                const EdgeInsets.only(bottom: 0, top: 40, left: 16, right: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Account',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => WebViewPage(),
                    ));
                  },
                  child: Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(bottom: 0, top: 10, left: 16, right: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Payments',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.arrow_forward),
              ],
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(bottom: 0, top: 20, left: 16, right: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.arrow_forward),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 0, top: 10, left: 16, right: 16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Help',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.arrow_forward),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 0, top: 10, left: 16, right: 16),
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // Call the logout method when the "Log out" text is tapped
                    _authController.logout();
                  },
                  child: Text(
                    'Log out',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 102, 102, 102),
                      fontStyle: FontStyle.normal,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
