import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthenticationController extends GetxController {
  static AuthenticationController authController = Get.find();

  late Rx<File?> pickedFile = Rx<File?>(null);
  File? get profileImage => pickedFile.value;

  pickImageFileFromGallery() async {
    XFile? imageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      Get.snackbar("Profile Image",
          "You have successfully picked your profile image from gallery");
      pickedFile.value = File(imageFile.path);
    }
  }

  captureImageFromPhoneCamera() async {
    XFile? imageFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (imageFile != null) {
      Get.snackbar("Profile Image",
          "You have successfully picked your profile image using the camera");
      pickedFile.value = File(imageFile.path);
    }
  }
}
