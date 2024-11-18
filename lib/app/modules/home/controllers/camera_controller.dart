import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CameraController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  var imageFile = Rxn<File>();
  var videoFile = Rxn<File>();

  Future<void> capturePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      imageFile.value = File(photo.path);
    }
  }

  Future<void> recordVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.camera);
    if (video != null) {
      videoFile.value = File(video.path);
    }
  }
}
