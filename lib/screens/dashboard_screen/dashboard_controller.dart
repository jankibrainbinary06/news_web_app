import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {


  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController categoryController = TextEditingController();
  TextEditingController subCategoryController = TextEditingController();
  TextEditingController editCategoryController = TextEditingController();


  List categoryList =[];

  bool isCategory = true;
  bool isNews = false;
  bool isLogout = false;
  bool isTapCategory = false;

}