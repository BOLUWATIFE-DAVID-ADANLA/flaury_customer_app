import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final imagePickerServiceProvider = Provider<ImagePickerService>((ref) {
  return ImagePickerService.instance;
});

class ImagePickerService {
  ImagePickerService._();

  static final instance = ImagePickerService._();

  static final _picker = ImagePicker();

  static Future<File?> getImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 100,
      );
      final File file = File(image!.path);
      return file;
    } catch (e) {
      debugPrint('Error picking image from camera: $e');
      return null;
    }
  }

  static Future<File?> getImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );
      final File file = File(image!.path);

      return file;
    } catch (e) {
      debugPrint('Error picking image from gallery: $e');
      return null;
    }
  }
}
