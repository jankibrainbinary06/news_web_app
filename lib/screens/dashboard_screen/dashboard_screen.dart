import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_web_app/common/text_styles.dart';
import 'package:news_web_app/screens/dashboard_screen/dashboard_controller.dart';
import 'package:news_web_app/screens/login_screen/login_screen.dart';
import 'package:news_web_app/utils/assets_res.dart';
import 'package:news_web_app/utils/color_res.dart';
import 'package:news_web_app/utils/string_res.dart';
import 'package:responsive_builder/responsive_builder.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.put(DashboardController());
    double width = 0;
    double height = 0;
    double textHeight = 0;
    double border = 0;
    bool isMobile = false;

    return GetBuilder<DashboardController>(
      id: 'dash',
      builder: (controller) {
        return Scaffold(
          key: dashboardController.scaffoldKey,
          drawer: Drawer(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              color: ColorRes.appColor.withOpacity(0.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      dashboardController.isNews = false;
                      dashboardController.isLogout = false;
                      dashboardController.isCategory = true;
                      dashboardController.update(['dash']);
                    },
                    child: SizedBox(
                      height: 70,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            AssetRes.category,
                            height: 20,
                            width: 20,
                            color: dashboardController.isCategory
                                ? ColorRes.appColor
                                : Colors.black.withOpacity(0.8),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            Strings.category,
                            style: TextStyle(
                                fontSize: 15,
                                color: dashboardController.isCategory
                                    ? ColorRes.appColor
                                    : Colors.black.withOpacity(0.8)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Divider(
                      height: 0.5,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      dashboardController.isCategory = false;
                      dashboardController.isLogout = false;
                      dashboardController.isNews = true;
                      dashboardController.update(['dash']);
                    },
                    child: SizedBox(
                      height: 70,
                      child: Row(
                        children: [
                          Image.asset(
                            AssetRes.news,
                            height: 20,
                            width: 20,
                            color: dashboardController.isNews
                                ? ColorRes.appColor
                                : Colors.black.withOpacity(0.8),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "News",
                            style: TextStyle(
                                fontSize: 15,
                                color: dashboardController.isNews
                                    ? ColorRes.appColor
                                    : Colors.black.withOpacity(0.8)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child:  Divider(
                      height: 0.5,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Dialog(
                              backgroundColor: Colors.transparent,
                              child: Container(
                                height: height * 0.6,
                                width: width * 2,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: ColorRes.appColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    5,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Center(
                                          child: Text(
                                            "Logout",
                                            style: poppinsBold.copyWith(
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: Get.width * 0.15,),
                                        GestureDetector(
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                          onTap: () {
                                            Get.back();
                                          },
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      height: Get.height * 0.01,
                                    ),
Container(color: ColorRes.appColor,width: width*0.5,height: 1,),
                                    SizedBox(
                                      height: Get.height * 0.04,
                                    ),
                                    Image.asset(
                                      AssetRes.logout,
                                      height: height * 0.07,
                                      width: width * 0.6,
                                      color: ColorRes.appColor,
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    Text(
                                      'Are you sure want to Log Out?',
                                      style: TextStyle(
                                        height: 1.5,
                                        color: Colors.black.withOpacity(0.8),
                                        fontWeight: FontWeight.w700,
                                        fontSize: textHeight * 0.04,
                                        fontFamily: "sfPro",
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.03,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.back();
                                        Get.to(const LoginScreen());
                                        dashboardController.update(['dash']);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: ColorRes.appColor,
                                          borderRadius: BorderRadius.circular(
                                            3,
                                          ),
                                        ),
                                        width: width * 0.8,
                                        height: height * 0.06,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Log Out",
                                          style: TextStyle(
                                              fontSize: height * 0.025,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: SizedBox(
                      height: 70,
                      child: Row(
                        children: [
                          Image.asset(
                            AssetRes.logout,
                            height: 20,
                            width: 20,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Log out",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black.withOpacity(0.8)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: ResponsiveBuilder(
            builder: (context, sizingInformation) {
              if (sizingInformation.isDesktop) {
                isMobile = false;
                width = 250;
                height = 600;
                textHeight = 640;
                border = 1;
              } else if (sizingInformation.isTablet) {
                isMobile = false;
                width = 200;
                height = 690;
                textHeight = 600;
                border = 1;
              } else if (sizingInformation.isMobile) {
                isMobile = true;
                width = 150;
                height = 600;
                textHeight = 550;
                border = 1;
              }
              return Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image: AssetImage(AssetRes.background), fit: BoxFit.fill),
                ),
                child: Row(
crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: Get.height * 0.16,),
                        Visibility(
                          visible: Get.width > 818,
                          child: Container(
                            margin: EdgeInsets.only(left: width * 0.1),
                            padding: EdgeInsets.symmetric(horizontal: width * 0.2),
                            // height: 300,
                            // width: width,
                            decoration: BoxDecoration(
                              color: ColorRes.appColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: ColorRes.appColor, width: 1),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                   SizedBox(
                                    height:  sizingInformation.isDesktop? 40:20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      dashboardController.isNews = false;
                                      dashboardController.isLogout = false;
                                      dashboardController.isCategory = true;
                                      dashboardController.update(['dash']);
                                    },
                                    child: Container(
                                      width:Get.width >1150? width * 0.89 : width * 0.7,
                                      padding: EdgeInsets.symmetric(horizontal: Get.width >1150? width * 0.15 :10 ,vertical: Get.height * 0.02),
                                      decoration: BoxDecoration(
                                        color: Colors.white,border: Border.all(color: ColorRes.appColor,width: 1),
                                        borderRadius: BorderRadius.circular(5,),
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            AssetRes.category,
                                            height: 20,
                                            width: 20,
                                            color: dashboardController.isCategory
                                                ? ColorRes.appColor
                                                : Colors.black.withOpacity(0.8),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            Strings.category,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: dashboardController.isCategory
                                                    ? ColorRes.appColor
                                                    : Colors.black.withOpacity(0.8)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20,),
                                  GestureDetector(
                                    onTap: () {
                                      dashboardController.isCategory = false;
                                      dashboardController.isLogout = false;
                                      dashboardController.isNews = true;
                                      dashboardController.update(['dash']);
                                    },
                                    child: Container(
                                      width:Get.width >1150? width * 0.89 : width * 0.7,
                                      padding: EdgeInsets.symmetric(horizontal: Get.width >1150? width * 0.15 :10 ,vertical: Get.height * 0.02),
                                      decoration: BoxDecoration(
                                        color: Colors.white,border: Border.all(color: ColorRes.appColor,width: 1),
                                        borderRadius: BorderRadius.circular(5,),
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            AssetRes.news,
                                            height: 20,
                                            width: 20,
                                            color: dashboardController.isNews
                                                ? ColorRes.appColor
                                                : Colors.black.withOpacity(0.8),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            'News',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: dashboardController.isNews
                                                    ? ColorRes.appColor
                                                    : Colors.black.withOpacity(0.8)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20,),
                                  GestureDetector(
                                    onTap: () {
                                      dashboardController.update(['dash']);

                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return BackdropFilter(
                                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                            child: Dialog(
                                              backgroundColor: Colors.transparent,
                                              child: Container(
                                                height: height * 0.6,
                                                width: width * 2,
                                                padding: const EdgeInsets.symmetric(
                                                  vertical: 10,
                                                  horizontal: 10,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    color: ColorRes.appColor,
                                                    width: 1,
                                                  ),
                                                  borderRadius: BorderRadius.circular(
                                                    5,
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    const SizedBox(
                                                      height: 2,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                      children: [
                                                        Center(
                                                          child: Text(
                                                            "Logout",
                                                            style: poppinsBold.copyWith(
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: Get.width * 0.15,),
                                                        GestureDetector(
                                                          child: const Icon(
                                                            Icons.close,
                                                            color: Colors.black,
                                                            size: 20,
                                                          ),
                                                          onTap: () {
                                                            Get.back();
                                                          },
                                                        ),
                                                      ],
                                                    ),

                                                    SizedBox(
                                                      height: Get.height * 0.01,
                                                    ),
                                                    Container(color: ColorRes.appColor,width: width*0.5,height: 1,),
                                                    SizedBox(
                                                      height: Get.height * 0.04,
                                                    ),
                                                    Image.asset(
                                                      AssetRes.logout,
                                                      height: height * 0.07,
                                                      width: width * 0.6,
                                                      color: ColorRes.appColor,
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.02,
                                                    ),
                                                    Text(
                                                      'Are you sure want to Log Out?',
                                                      style: TextStyle(
                                                        height: 1.5,
                                                        color: Colors.black.withOpacity(0.8),
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: textHeight * 0.04,
                                                        fontFamily: "sfPro",
                                                      ),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                    SizedBox(
                                                      height: Get.height * 0.03,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.back();
                                                        Get.to(const LoginScreen());
                                                        dashboardController.update(['dash']);
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: ColorRes.appColor,
                                                          borderRadius: BorderRadius.circular(
                                                            3,
                                                          ),
                                                        ),
                                                        width: width * 0.8,
                                                        height: height * 0.06,
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "Log Out",
                                                          style: TextStyle(
                                                              fontSize: height * 0.025,
                                                              fontWeight: FontWeight.w600,
                                                              color: Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: height * 0.02,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      width:Get.width >1150? width * 0.89 : width * 0.7,
                                      padding: EdgeInsets.symmetric(horizontal: Get.width >1150? width * 0.15 :10 ,vertical: Get.height * 0.02),
                                      decoration: BoxDecoration(
                                        color: Colors.white,border: Border.all(color: ColorRes.appColor,width: 1),
                                        borderRadius: BorderRadius.circular(5,),
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            AssetRes.logout,
                                            height: 20,
                                            width: 20,
                                            color: dashboardController.isLogout
                                                ? ColorRes.appColor
                                                : Colors.black.withOpacity(0.8),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            "Log out",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: dashboardController.isLogout
                                                    ? ColorRes.appColor
                                                    : Colors.black.withOpacity(0.8)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                   SizedBox(
                                    height: sizingInformation.isDesktop? 40: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: Get.height * 0.08,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Visibility(
                                  visible: Get.width <= 818,
                                  child: GestureDetector(
                                    onTap: () {
                                      dashboardController
                                          .scaffoldKey.currentState
                                          ?.openDrawer();
                                    },
                                    child: Container(
                                      height:
                                          sizingInformation.isDesktop ? 50 : 40,
                                      width: width * 0.7,
                                      decoration: BoxDecoration(
                                        color: ColorRes.appColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.menu,color: Colors.white,),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Menu",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Icon(Icons.arrow_back_sharp,),
                                dashboardController.isCategory
                                    ? GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return BackdropFilter(
                                                filter: ImageFilter.blur(
                                                    sigmaX: 2, sigmaY: 2),
                                                child: Dialog(
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  child: Container(
                                                    height: height * 0.55,
                                                    width: width * 2,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      vertical: 10,
                                                      horizontal: 10,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(
                                                        color: ColorRes.appColor,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        5,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 2,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            GestureDetector(
                                                              child:  Icon(
                                                                Icons.close,
                                                                color: Colors
                                                                    .black.withOpacity(0.8),
                                                                size: 20,
                                                              ),
                                                              onTap: () {
                                                                Get.back();
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          'Add category',
                                                          style: TextStyle(
                                                              height: 1.5,
                                                              color:
                                                                  Colors.black.withOpacity(0.8),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize:
                                                                  textHeight *
                                                                      0.04,
                                                              fontFamily:
                                                                  "sfPro",
                                                              letterSpacing: 2),
                                                        ),
                                                        SizedBox(
                                                          height: Get.height *
                                                              0.008,
                                                        ),
                                                        Container(
                                                          height: 1,
                                                          width: width * 0.8,
                                                          color: ColorRes.appColor,
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              Get.height * 0.04,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [

                                                            SizedBox(
                                                              height:
                                                                  Get.height *
                                                                      0.02,
                                                            ),
                                                            Container(
                                                              
                                                              height:
                                                                  height * 0.06,
                                                              width:
                                                                  width * 1.3,
                                                              decoration:
                                                                  BoxDecoration(
                                                                    color: ColorRes.appColor.withOpacity(0.1),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  5,
                                                                ),
                                                                border:
                                                                    Border.all(
                                                                        color: ColorRes.appColor
                                                                         ,
                                                                        width:
                                                                            border),
                                                              ),
                                                              child: TextField(
                                                                controller: dashboardController.categoryController,
                                                                style:
                                                                     TextStyle(
                                                                  fontFamily:
                                                                      "sfPro",
                                                                  color: Colors
                                                                      .black.withOpacity(0.8),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .only(
                                                                    left: width *
                                                                        0.08,
                                                                    bottom:
                                                                        height *
                                                                            0.023,
                                                                  ),
                                                                  hintStyle:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "sfPro",
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.6),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                  hintText:
                                                                      'Add category',
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              Get.height * 0.05,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            dashboardController.categoryList.add(dashboardController.categoryController.text);
                                                            Get.back();
                                                            showDialog(
                                                              context: context,
                                                              builder: (context) {
                                                                return BackdropFilter(
                                                                  filter: ImageFilter.blur(
                                                                      sigmaX: 2, sigmaY: 2),
                                                                  child: Dialog(
                                                                    backgroundColor:
                                                                    Colors.transparent,
                                                                    child: Container(
                                                                      height: height * 0.55,
                                                                      width: width * 2,
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                        vertical: 10,
                                                                        horizontal: 10,
                                                                      ),
                                                                      decoration: BoxDecoration(
                                                                        color: Colors.white,
                                                                        border: Border.all(
                                                                          color: ColorRes.appColor,
                                                                          width: 1,
                                                                        ),
                                                                        borderRadius:
                                                                        BorderRadius.circular(
                                                                          5,
                                                                        ),
                                                                      ),
                                                                      child: Column(
                                                                        children: [
                                                                          const SizedBox(
                                                                            height: 2,
                                                                          ),
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .end,
                                                                            children: [
                                                                              GestureDetector(
                                                                                child:  Icon(
                                                                                  Icons.close,
                                                                                  color: Colors
                                                                                      .black.withOpacity(0.8),
                                                                                  size: 20,
                                                                                ),
                                                                                onTap: () {
                                                                                  Get.back();
                                                                                },
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Text(
                                                                            'Sports',
                                                                            style: TextStyle(
                                                                                height: 1.5,
                                                                                color:
                                                                                Colors.black.withOpacity(0.8),
                                                                                fontWeight:
                                                                                FontWeight
                                                                                    .w600,
                                                                                fontSize:
                                                                                textHeight *
                                                                                    0.04,
                                                                                fontFamily:
                                                                                "sfPro",
                                                                                letterSpacing: 2),
                                                                          ),
                                                                          SizedBox(
                                                                            height: Get.height *
                                                                                0.008,
                                                                          ),
                                                                          Container(
                                                                            height: 1,
                                                                            width: width * 0.8,
                                                                            color: ColorRes.appColor,
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                            Get.height * 0.04,
                                                                          ),
                                                                          Column(
                                                                            crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .start,
                                                                            children: [

                                                                              SizedBox(
                                                                                height:
                                                                                Get.height *
                                                                                    0.02,
                                                                              ),
                                                                              Container(

                                                                                height:
                                                                                height * 0.06,
                                                                                width:
                                                                                width * 1.3,
                                                                                decoration:
                                                                                BoxDecoration(
                                                                                  color: ColorRes.appColor.withOpacity(0.1),
                                                                                  borderRadius:
                                                                                  BorderRadius
                                                                                      .circular(
                                                                                    5,
                                                                                  ),
                                                                                  border:
                                                                                  Border.all(
                                                                                      color: ColorRes.appColor
                                                                                      ,
                                                                                      width:
                                                                                      border),
                                                                                ),
                                                                                child: TextField(
                                                                                  controller: dashboardController.subCategoryController,
                                                                                  style:
                                                                                  TextStyle(
                                                                                    fontFamily:
                                                                                    "sfPro",
                                                                                    color: Colors
                                                                                        .black.withOpacity(0.8),
                                                                                    fontWeight:
                                                                                    FontWeight
                                                                                        .w500,
                                                                                  ),
                                                                                  decoration:
                                                                                  InputDecoration(
                                                                                    border:
                                                                                    InputBorder
                                                                                        .none,
                                                                                    contentPadding:
                                                                                    EdgeInsets
                                                                                        .only(
                                                                                      left: width *
                                                                                          0.08,
                                                                                      bottom:
                                                                                      height *
                                                                                          0.023,
                                                                                    ),
                                                                                    hintStyle:
                                                                                    TextStyle(
                                                                                      fontFamily:
                                                                                      "sfPro",
                                                                                      color: Colors
                                                                                          .black
                                                                                          .withOpacity(
                                                                                          0.6),
                                                                                      fontWeight:
                                                                                      FontWeight
                                                                                          .w500,
                                                                                    ),
                                                                                    hintText:
                                                                                    'Add sport sub category',
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                            Get.height * 0.05,
                                                                          ),
                                                                          GestureDetector(
                                                                            onTap: () {
                                                                              dashboardController
                                                                                  .update(
                                                                                  ['dash']);

                                                                              Get.back();
                                                                            },
                                                                            child: Container(
                                                                              decoration:
                                                                              BoxDecoration(
                                                                                color: ColorRes
                                                                                    .appColor,
                                                                                borderRadius:
                                                                                BorderRadius
                                                                                    .circular(
                                                                                  5,
                                                                                ),
                                                                              ),
                                                                              width: width * 0.7,
                                                                              height:
                                                                              height * 0.07,
                                                                              alignment: Alignment
                                                                                  .center,
                                                                              child: Text(
                                                                                "Add News",
                                                                                style: TextStyle(
                                                                                    fontSize:
                                                                                    height *
                                                                                        0.025,
                                                                                    fontWeight:
                                                                                    FontWeight
                                                                                        .w600,
                                                                                    color: Colors.white
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height: height * 0.02,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                            dashboardController
                                                                .update(
                                                                    ['dash']);
                                                          },
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: ColorRes
                                                                  .appColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                5,
                                                              ),
                                                            ),
                                                            width: width * 0.7,
                                                            height:
                                                                height * 0.07,
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              "Next",
                                                              style: TextStyle(
                                                                fontSize:
                                                                    height *
                                                                        0.025,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors.white
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: height * 0.02,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Container(
                                          height: sizingInformation.isDesktop
                                              ? 50
                                              : 40,
                                          width: width * 0.7,
                                          decoration: BoxDecoration(
                                              color: ColorRes.appColor,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                AssetRes.add,
                                                height: 15,
                                                width: 15,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Text(
                                                "ADD",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'sfPro',
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            dashboardController.isCategory
                                ?
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal:
sizingInformation.isMobile?10:
                              Get.height > 1360?

                              width * 0.6 : Get.height <=1360 && Get.height > 1050? width* 0.25 : width * 0.3,vertical: Get.height * 0.04),
                                  height: Get.height * 0.8,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(width: 1,color: ColorRes.appColor)
                                  ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                   Text(Strings.category, style: poppinsBold.copyWith(fontWeight: FontWeight.w900,fontSize: 20,fontFamily: 'poppinsSemiBold'),),
SizedBox(height: Get.height * 0.04,),

                                  Expanded(
                                    child: GridView.builder(

                                      itemCount: dashboardController.categoryList.length,

                                      gridDelegate:    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                                      crossAxisSpacing: Get.width > 1850 ?500 :  (Get.width>1520 && Get.height <= 1850 ) ?200 : 0,

                                      childAspectRatio:Get.width > 850 ?5:3.5,
                                      ), itemBuilder: (context, index) {
                                    return  SizedBox(

                                      child: Row(
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {

                                                },
                                                child: Container(
                                                  width: Get.width > 1150 ?width * 0.89 : width * 0.6,
                                                  alignment: Alignment.center,
                                                  height: Get.height * 0.05,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,border: Border.all(color: ColorRes.appColor,width: 1),
                                                    borderRadius: BorderRadius.circular(5,),
                                                  ),
                                                  child: Text(
                                                  dashboardController.categoryList[index],
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color:  Colors.black.withOpacity(0.8)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width:sizingInformation.isMobile? 5: 15,),
                                            GestureDetector(
                                                onTap: () {
                                                  dashboardController.editCategoryController.text = dashboardController.categoryList[index]
                                                  ;
                                                  showDialog(
                                                    context:
                                                    context,
                                                    builder:
                                                        (context) {
                                                      return BackdropFilter(
                                                        filter: ImageFilter.blur(
                                                            sigmaX:
                                                            2,
                                                            sigmaY:
                                                            2),
                                                        child:
                                                        Dialog(
                                                          backgroundColor:
                                                          Colors.transparent,
                                                          child:
                                                          Container(
                                                            height:
                                                            height * 0.5,
                                                            width:
                                                            width * 2,
                                                            padding:
                                                            const EdgeInsets.symmetric(
                                                              vertical: 10,
                                                              horizontal: 10,
                                                            ),
                                                            decoration:
                                                            BoxDecoration(
                                                              color: Colors.white,
                                                              border: Border.all(
                                                                color: ColorRes.appColor,
                                                                width: 1,
                                                              ),
                                                              borderRadius: BorderRadius.circular(
                                                                5,
                                                              ),
                                                            ),
                                                            child:
                                                            Column(
                                                              children: [
                                                                const SizedBox(
                                                                  height: 2,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                  children: [
                                                                    GestureDetector(
                                                                      child:  Icon(
                                                                        Icons.close,
                                                                        color: Colors.black.withOpacity(0.8),
                                                                        size: 20,
                                                                      ),
                                                                      onTap: () {
                                                                        Get.back();
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                                Text(
                                                                  'Edit Category',
                                                                  style: TextStyle(height: 1.5, color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.w600, fontSize: textHeight * 0.04, fontFamily: "sfPro", letterSpacing: 2),
                                                                ),
                                                                SizedBox(
                                                                  height: Get.height * 0.008,
                                                                ),
                                                                Container(
                                                                  height: 1,
                                                                  width: width * 0.3,
                                                                  color: ColorRes.appColor,
                                                                ),
                                                                SizedBox(
                                                                  height: Get.height * 0.04,
                                                                ),
                                                                Container(
                                                                  height: height * 0.08,
                                                                  width: width * 1.3,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(
                                                                      5,
                                                                    ),
                                                                    border: Border.all(
                                                                        color: ColorRes.appColor,
                                                                        width: border),
                                                                  ),
                                                                  child: TextField(
                                                                    controller: dashboardController.editCategoryController,
                                                                    style:  TextStyle(
                                                                      fontFamily: "sfPro",
                                                                      color: Colors.black.withOpacity(0.8),
                                                                      fontWeight: FontWeight.w500,
                                                                    ),
                                                                    decoration: InputDecoration(
                                                                      border: InputBorder.none,
                                                                      contentPadding: EdgeInsets.only(
                                                                        left: width * 0.18,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: Get.height * 0.05,
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {


                                                                    dashboardController.categoryList[index] = dashboardController.editCategoryController.text;
Get.back()
         ;                                                        dashboardController.update(['dash']);
                                                                  },
                                                                  child: Container(
                                                                    decoration: BoxDecoration(
                                                                      color: ColorRes.appColor,
                                                                      borderRadius: BorderRadius.circular(
                                                                      5,
                                                                      ),
                                                                    ),
                                                                    width: width * 0.5,
                                                                    height: height * 0.07,
                                                                    alignment: Alignment.center,
                                                                    child: Text(
                                                                      "Upload",
                                                                      style: TextStyle(
                                                                        fontSize: height * 0.025,
                                                                        fontWeight: FontWeight.w600,
color: Colors.white
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: height * 0.02,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },

                                                child: Image.asset(AssetRes.edit,height:sizingInformation.isMobile? 15 : 20,width: sizingInformation.isMobile?15 : 20,color: ColorRes.appColor,)),
                                            SizedBox(width:sizingInformation.isMobile? 5: 15,),
                                            GestureDetector(
                                                       onTap: () {


                                                                  showDialog(
                                                                          context:
                                                                          context,
                                                                          builder:
                                                                              (context) {
                                                                            return BackdropFilter(
                                                                              filter: ImageFilter.blur(
                                                                                  sigmaX:
                                                                                  2,
                                                                                  sigmaY:
                                                                                  2),
                                                                              child:
                                                                              Dialog(
                                                                                backgroundColor:
                                                                                Colors.transparent,
                                                                                child:
                                                                                Container(
                                                                                  height:
                                                                                  height * 0.5,
                                                                                  width:
                                                                                  width * 2,
                                                                                  padding:
                                                                                  const EdgeInsets.symmetric(
                                                                                    vertical: 10,
                                                                                    horizontal: 10,
                                                                                  ),
                                                                                  decoration:
                                                                                  BoxDecoration(
                                                                                    color: Colors.white,
                                                                                    border: Border.all(
                                                                                      color: ColorRes.appColor,
                                                                                      width: 1,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(
                                                                                      5,
                                                                                    ),
                                                                                  ),
                                                                                  child:
                                                                                  Column(
                                                                                    children: [
                                                                                      const SizedBox(
                                                                                        height: 2,
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                        children: [
                                                                                          GestureDetector(
                                                                                            child:  Icon(
                                                                                              Icons.close,
                                                                                              color: Colors.black.withOpacity(0.8),
                                                                                              size: 20,
                                                                                            ),
                                                                                            onTap: () {
                                                                                              Get.back();
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Stack(
                                                                                        alignment: Alignment.center,
                                                                                        children: [
                                                                                          Container(
                                                                                            height: height * 0.13,
                                                                                            width: height * 0.13,
                                                                                            decoration:  BoxDecoration(
                                                                                              color: ColorRes.appColor.withOpacity(0.3),
                                                                                              shape: BoxShape.circle,
                                                                                            ),
                                                                                          ),
                                                                                          Image.asset(
                                                                                            AssetRes.delete,
                                                                                            height: height * 0.08,
                                                                                            width: height * 0.08,
                                                                                            fit: BoxFit.fill,
                                                                                            color: ColorRes.appColor,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: Get.height * 0.02,
                                                                                      ),
                                                                                      Text(
                                                                                        'Are you sure want to delete ${dashboardController.categoryList[index]} Category?',
                                                                                        style: TextStyle(
                                                                                          height: 1.5,
                                                                                          color: Colors.black.withOpacity(0.8),
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontSize: textHeight * 0.04,
                                                                                          fontFamily: "sfPro",
                                                                                        ),
                                                                                        textAlign: TextAlign.center,
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: Get.height * 0.03,
                                                                                      ),
                                                                                      GestureDetector(
                                                                                        onTap: () {
                                                                                          dashboardController.categoryList.removeAt(index);
                                                                                          Get.back();
                                                                                          dashboardController.update(['dash']);

                                                                                        },
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: ColorRes.appColor,
                                                                                            borderRadius: BorderRadius.circular(
                                                                                              5,
                                                                                            ),
                                                                                          ),
                                                                                          width: width * 0.7,
                                                                                          height: height * 0.06,
                                                                                          alignment: Alignment.center,
                                                                                          child: Text(
                                                                                            "Delete",
                                                                                            style: TextStyle(
                                                                                              fontSize: height * 0.025,
                                                                                              fontWeight: FontWeight.w600,
color: Colors.white,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: height * 0.02,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        );



                                                },
                                                child: Image.asset(AssetRes.delete,height:sizingInformation.isMobile? 15 : 20,width: sizingInformation.isMobile?15 : 20,color: ColorRes.appColor,)),
                                          ],
                                        ),
                                    );
                                    },),
                                  )
                                ],
                              ),
                                )
                                : Expanded(


                                     child: SingleChildScrollView(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
