import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_web_app/screens/dashboard_screen/dashboard_screen.dart';
import 'package:news_web_app/utils/string_res.dart';

class LoginController extends GetxController{



  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String emailError = "";
  String passError = "";



  bool validation() {
    emailValidation();
    passValidation();
    update(["admin"]);
    if (emailError == '' && passError == '') {
      return true;
    } else {
      return false;
    }

  }
  passValidation() {
    if (passwordController.text.trim() == "") {
      passError = Strings.errorCommon;
      update(["admin"]);
    } else {
      passError = "";
      update(["admin"]);
    }
  }

  emailValidation() {
    if (emailController.text.trim() == "") {
      emailError = Strings.errorCommon;
      update(['admin']);
    } else {
      if (RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(emailController.text)) {
        emailError = '';
        update(['admin']);
      } else {
        emailError = Strings.emailError;
        update(['admin']);
      }
    }
  }

  onTapLogin(BuildContext context ) async {

    if (validation()) {


Get.to(const DashBoardScreen());
        emailController.clear();
        passwordController.clear();

    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter correct credentials!!")));

    }
    update(["admin"]);
  }


}