import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController categoryController = TextEditingController();
  TextEditingController subCategoryController = TextEditingController();
  TextEditingController editCategoryController = TextEditingController();
  TextEditingController addHeadLineController = TextEditingController();

  List categoryList = [];
  int idindex = 0;
  bool isCategory = true;
  bool isNews = false;
  bool isLogout = false;
  bool isTapCategory = false;
  // PlatformFile? imageFile;
  // List<Uint8List> imagesPath = [];

  //  Future<void> pickImage() async {
  //
  //
  //    try {
  //      FilePickerResult? result = await FilePicker.platform.pickFiles(
  //        type: FileType.custom,
  //        allowMultiple: true,
  //        allowedExtensions: ['jpg', 'png', 'webp', 'jpeg'],
  //      );
  //
  //      if (result == null) return;
  //
  //
  //        imageFile = result.files.first;
  //        result.files.forEach((element) {
  //          if (element.extension == 'jpg' ||
  //              element.extension == 'png' ||
  //              element.extension == 'jpeg' ||
  //              element.extension == 'webp') {
  //            imagesPath.add(element.bytes!);
  //          }
  //        });
  //   update(['dash']);
  //      print(imageFile!.bytes);
  //    } catch (e) {
  // print('hdus');
  //    }
  //  }
}
