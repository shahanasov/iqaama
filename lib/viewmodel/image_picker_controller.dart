
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shahanas/data/photo.dart';
import 'package:shahanas/viewmodel/datacontroller.dart';

class PropertyPhotoController extends GetxController {
  final picker = ImagePicker();
  final formController = Get.find<PropertyFormController>();

  Future<void> onCameraTap() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null && formController.photos.length < 10) {
      formController.photos.add(PhotoModel(imagePath: pickedFile.path));
    }
  }

  Future<void> onGalleryTap() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null && formController.photos.length < 10) {
      formController.photos.add(PhotoModel(imagePath: pickedFile.path));
    }
  }

  void removePhoto(int index) {
    if (index >= 0 && index < formController.photos.length) {
      formController.photos.removeAt(index);
    }
  }

    int get photoCount => formController.photos.length;
}
