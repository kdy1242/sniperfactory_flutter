
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

import '../model/profile.dart';
import 'auth_controller.dart';

class MainController extends GetxController {
  final RxList images = [].obs;

  User? get user => Get.find<AuthController>().user.value;
  Profile? get profile => Get.find<AuthController>().profile.value;

  fetchImages() async {
    var ref = FirebaseStorage.instance.ref('/images');
    var res = await ref.listAll();
    images.clear();
    for (var item in res.items) {
      var url = await item.getDownloadURL();
      images.add(url);
    }
  }

  uploadImage(XFile file) {
    var ref = FirebaseStorage.instance.ref('/images/${file.name}.png');
    ref.putFile(File(file.path)).then((p0) {
      fetchImages();
    });
  }

  handleOnTap() async {
    var picker = ImagePicker();
    var res = await picker.pickImage(source: ImageSource.gallery);
    if (res != null) {
      // 스토리지 올리기
      var ref = FirebaseStorage.instance.ref('profile/${user!.uid}');
      await ref.putFile(File(res.path));
      var downloadUrl = await ref.getDownloadURL();
      print(downloadUrl);
      // downloadUrl 받기
      user!.updatePhotoURL(downloadUrl);
    }
  }
}
