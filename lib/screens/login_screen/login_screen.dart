import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_web_app/common/common_textfield.dart';
import 'package:news_web_app/screens/login_screen/login_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../common/text_styles.dart';
import '../../utils/assets_res.dart';
import '../../utils/color_res.dart';
import '../../utils/string_res.dart';

class LoginScreen extends StatelessWidget {
 const  LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
 double width = 0;
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.isDesktop) {
          width = 700;
        } else if (sizingInformation.isTablet) {
          width = 450;
        } else if (sizingInformation.isMobile) {
        width = 300;
        }
        return Scaffold(
          body:
          GetBuilder<LoginController>(

            id: 'admin',
            builder: (controller) {

            return Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                    image: AssetImage(AssetRes.background),
                    fit: BoxFit.fill),
              ),
              child:
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(Strings.hello,style: poppinsBold.copyWith(color: Colors.black,fontSize: 40),),
    Text(Strings.again,style: poppinsBold.copyWith(color: ColorRes.appColor,fontSize: 40),),
  ],
),const SizedBox(height: 1,),
                    Text(Strings.welcomeBack,style: mediumSf.copyWith(color: Colors.black.withOpacity(0.7,),fontSize: 30),),


                    const SizedBox(height: 20,),
                    Container(
                     decoration: BoxDecoration(
                       borderRadius: const BorderRadius.all( Radius.circular(5,),),
                       border:  Border.all(color: ColorRes.appColor,width: 1),
                       color: Colors.white
                     ),
                      padding: EdgeInsets.symmetric(vertical: sizingInformation.isDesktop? Get.height *  0.07 : Get.height * 0.07,horizontal:  width * 0.12),
                      child:
                      Column(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: width * 0.8,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black.withOpacity(0.8),width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: CommonTextField(
                              controller: controller.emailController,
                              hintText: "Enter email ID",
                              child: Image.asset(
                                AssetRes.lock,
                                color: Colors.black,
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),
                          controller.emailError == ''
                              ? const SizedBox()
                              : SizedBox(height: Get.height * 0.01),
                          (controller.emailError == '')
                              ? const SizedBox()
                              : Text(
                            controller.emailError,
                            style: errorTextStyle,
                          ),
                          const SizedBox(
                            height: 25,
                          ),

                          Container(
                            width: width * 0.8,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black.withOpacity(0.8),width: 1),

                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: CommonTextField(
                              controller: controller.passwordController,
                              hintText: "Enter password",
                              child: Image.asset(
                                AssetRes.email,
                                color: Colors.black,
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ),

                          controller.passError == ''
                              ? const SizedBox()
                              : SizedBox(height: Get.height * 0.01),
                          (controller.passError == '')
                              ? const SizedBox()
                              : Text(
                            controller.passError,
                            style: errorTextStyle,
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.onTapLogin(context);
                            },

                            child: Container(
                              height: 55,
                              width: 200,
                              decoration: BoxDecoration(
                                color: ColorRes.appColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              alignment: Alignment.center,
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "sfPro"),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                  ],
                ),
              ),


            );
          },)


        );
      },
    );
  }
}
