import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController categoryController = TextEditingController();
  TextEditingController subCategoryController = TextEditingController();
  TextEditingController editCategoryController = TextEditingController();
  TextEditingController addHeadLineController = TextEditingController();
  TextEditingController channelController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController topicController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController editHeadlineC = TextEditingController();
  TextEditingController editChannelC = TextEditingController();
  TextEditingController  editDateC= TextEditingController();
  TextEditingController editTimeC = TextEditingController();
  TextEditingController editCityC = TextEditingController();
  TextEditingController editStateC = TextEditingController();
  TextEditingController editTopicC = TextEditingController();
  TextEditingController editDesC = TextEditingController();



  bool isCategory = true;
  bool isNews = false;
  bool isLogout = false;
  bool isTapCategory = false;
  bool isNewsAdded = false;
  bool isNewsCategory = true;
  bool isDrop = false;
  bool isNewsDetail = false;


  int selectedIndex = 0;


  List categoryList = [];
  int idindex = 0;

String? headline = '';
String? channel = '';
String? date = '';
String?time  = '';
String? state = '';
String?  city= '';
String?  topic= '';
String?  description= '';

  PlatformFile? imageFile;
  List<Uint8List> imagesPath = [];

  Uint8List? imageData ;
  Uint8List? newsImage;


  List? dropValue = List.generate(9, (index) => 'Male');

  List<String>? dropItems = ["Male", "Female", "Other"];

  dropOnChange(String? value, int? index) {
    dropValue![index!] = value!;
    isNewsDetail = true;
    update(["dash"]);
  }

  Future<void> pickImage() async {


    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: false,
        allowedExtensions: ['jpg', 'png', 'webp', 'jpeg'],
      );

      if (result == null) return;

       imageData = result.files.first.bytes;

        imageFile = result.files.first;
        result.files.forEach((element) {
          if (element.extension == 'jpg' ||
              element.extension == 'png' ||
              element.extension == 'jpeg' ||
              element.extension == 'webp') {
            imagesPath.add(element.bytes!);
          }
        });
   update(['dash']);
      print(imageFile!.bytes);
    } catch (e) {
 print('hdus');
    }
  }
}