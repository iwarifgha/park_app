import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../services/api/img_service.dart';

class ImagePickerClass {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}

class UploadImageController extends GetxController {
  var imageFile = Rx<File?>(null);
  var imageUrl = Rx<String?>(null);
  var isUploading = false.obs;

  final ImagePickerClass _imagePicker = ImagePickerClass();
  final ImgBBService _imgBBService = ImgBBService();

  Future<void> pickAndUploadImage() async {
    imageFile.value = await _imagePicker.pickImage();
    if (imageFile.value != null) {
      isUploading.value = true;
      String? uploadedUrl = await _imgBBService.uploadImage(imageFile.value!);
      if (uploadedUrl != null) {
        imageUrl.value = uploadedUrl;
        print('Uploaded Image URL: $uploadedUrl');
      }
      isUploading.value = false;
    }
  }
}
