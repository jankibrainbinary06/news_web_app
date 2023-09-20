import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_web_app/common/text_styles.dart';
import 'package:news_web_app/screens/dashboard_screen/dashboard_controller.dart';
import 'package:news_web_app/screens/news_screen/widgets/edit_news_popup.dart';
import 'package:news_web_app/screens/news_screen/widgets/news_detail.dart';
import 'package:news_web_app/utils/assets_res.dart';
import 'package:news_web_app/utils/color_res.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../utils/string_res.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.put(DashboardController());
    var selectedItem = '';
    double width = 0;
    double height = 0;
    double textHeight = 0;
    double border = 0;
    bool isMobile = false;

    return Expanded(
      child: ResponsiveBuilder(builder: (context, sizingInformation) {
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
                    child: Row(
                      children: [
                        SizedBox(
                          width: width * 0.1,
                        ),
                        GestureDetector(
                            onTap: () {
                              dashboardController.isTapCategory = false;
                              dashboardController.update(['dash']);
                            },
                            child: Icon(
                              Icons.arrow_back_sharp,
                              size: 30,
                              color: Colors.black.withOpacity(0.8),
                            )),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: Get.width <= 818,
                    child: GestureDetector(
                      onTap: () {
                        dashboardController.scaffoldKey.currentState
                            ?.openDrawer();
                      },
                      child: Container(
                        height: sizingInformation.isDesktop ? 50 : 40,
                        width: width * 0.7,
                        decoration: BoxDecoration(
                          color: ColorRes.appColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
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
                  dashboardController.isNewsAdded
                      ? Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                dashboardController.editHeadlineC.text =
                                    dashboardController.headline!;
                                dashboardController.editChannelC.text =
                                    dashboardController.channel!;
                                dashboardController.editTimeC.text =
                                    dashboardController.time!;
                                dashboardController.editDateC.text =
                                    dashboardController.date!;
                                dashboardController.editCityC.text =
                                    dashboardController.city!;
                                dashboardController.editStateC.text =
                                    dashboardController.state!;
                                dashboardController.editDesC.text =
                                    dashboardController.description!;
                                dashboardController.editTopicC.text =
                                    dashboardController.topic!;
                                // showDialog(
                                //   context: context,
                                //   builder: (context) {
                                //     return StatefulBuilder(
                                //       builder: (context, updateDialog) {
                                //         return BackdropFilter(
                                //           filter: ImageFilter.blur(
                                //               sigmaX: 2, sigmaY: 2),
                                //           child: Dialog(
                                //             backgroundColor: Colors.transparent,
                                //             child: Container(
                                //               // height: height * 0.55,
                                //               width: width * 2,
                                //               padding:
                                //                   const EdgeInsets.symmetric(
                                //                 vertical: 10,
                                //                 horizontal: 10,
                                //               ),
                                //               decoration: BoxDecoration(
                                //                 color: Colors.white,
                                //                 border: Border.all(
                                //                   color: ColorRes.appColor,
                                //                   width: 1,
                                //                 ),
                                //                 borderRadius:
                                //                     BorderRadius.circular(
                                //                   5,
                                //                 ),
                                //               ),
                                //               child: Column(
                                //                 children: [
                                //                   const SizedBox(
                                //                     height: 2,
                                //                   ),
                                //                   Row(
                                //                     mainAxisAlignment:
                                //                         MainAxisAlignment.end,
                                //                     children: [
                                //                       GestureDetector(
                                //                         child: Icon(
                                //                           Icons.close,
                                //                           color: Colors.black
                                //                               .withOpacity(0.8),
                                //                           size: 20,
                                //                         ),
                                //                         onTap: () {
                                //                           Get.back();
                                //                         },
                                //                       ),
                                //                     ],
                                //                   ),
                                //                   Text(
                                //                     'Edit News detail',
                                //                     style: TextStyle(
                                //                         height: 1.5,
                                //                         color: Colors.black
                                //                             .withOpacity(0.8),
                                //                         fontWeight:
                                //                             FontWeight.w600,
                                //                         fontSize:
                                //                             textHeight * 0.04,
                                //                         fontFamily: "sfPro",
                                //                         letterSpacing: 2),
                                //                   ),
                                //                   SizedBox(
                                //                     height: Get.height * 0.008,
                                //                   ),
                                //                   Container(
                                //                     height: 1,
                                //                     width: width * 0.8,
                                //                     color: ColorRes.appColor,
                                //                   ),
                                //                   SizedBox(
                                //                     height: Get.height * 0.04,
                                //                   ),
                                //                   Column(
                                //                     crossAxisAlignment:
                                //                         CrossAxisAlignment
                                //                             .center,
                                //                     children: [
                                //                       SizedBox(
                                //                         height:
                                //                             Get.height * 0.02,
                                //                       ),
                                //                       dashboardController
                                //                                   .newsImage ==
                                //                               null
                                //                           ? const SizedBox()
                                //                           : Container(
                                //                               decoration:
                                //                                   BoxDecoration(
                                //                                 borderRadius:
                                //                                     BorderRadius
                                //                                         .circular(
                                //                                   10,
                                //                                 ),
                                //                                 border: Border.all(
                                //                                     color: Colors
                                //                                         .white,
                                //                                     width: 1),
                                //                               ),
                                //                               child: ClipRRect(
                                //                                 borderRadius:
                                //                                     BorderRadius
                                //                                         .circular(
                                //                                   10,
                                //                                 ),
                                //                                 child: Image
                                //                                     .memory(
                                //                                   Uint8List.fromList(
                                //                                       dashboardController
                                //                                           .newsImage!),
                                //                                   width: width *
                                //                                       0.8,
                                //                                   height: sizingInformation
                                //                                           .isDesktop
                                //                                       ? height *
                                //                                           0.24
                                //                                       : height *
                                //                                           0.14,
                                //                                   fit: BoxFit
                                //                                       .cover,
                                //                                 ),
                                //                               ),
                                //                             ),
                                //                       const SizedBox(
                                //                         height: 10,
                                //                       ),
                                //                       Container(
                                //                         // height: height * 0.06,
                                //                         width: width * 1.3,
                                //                         decoration:
                                //                             BoxDecoration(
                                //                           color: ColorRes
                                //                               .appColor
                                //                               .withOpacity(0.1),
                                //                           borderRadius:
                                //                               BorderRadius
                                //                                   .circular(
                                //                             5,
                                //                           ),
                                //                           border: Border.all(
                                //                               color: ColorRes
                                //                                   .appColor,
                                //                               width: border),
                                //                         ),
                                //                         child: Row(
                                //                           children: [
                                //                             SizedBox(
                                //                               width:
                                //                                   width * 1.15,
                                //                               child: TextField(
                                //                                 maxLines: 2,
                                //                                 controller:
                                //                                     dashboardController
                                //                                         .editHeadlineC,
                                //                                 style:
                                //                                     TextStyle(
                                //                                   fontFamily:
                                //                                       "sfPro",
                                //                                   color: Colors
                                //                                       .black
                                //                                       .withOpacity(
                                //                                           0.8),
                                //                                   fontWeight:
                                //                                       FontWeight
                                //                                           .w500,
                                //                                 ),
                                //                                 decoration:
                                //                                     InputDecoration(
                                //                                   border:
                                //                                       InputBorder
                                //                                           .none,
                                //                                   contentPadding:
                                //                                       EdgeInsets
                                //                                           .only(
                                //                                     left: width *
                                //                                         0.08,
                                //                                     bottom:
                                //                                         height *
                                //                                             0.023,
                                //                                   ),
                                //                                   hintStyle:
                                //                                       TextStyle(
                                //                                     fontFamily:
                                //                                         "sfPro",
                                //                                     color: Colors
                                //                                         .black
                                //                                         .withOpacity(
                                //                                             0.6),
                                //                                     fontWeight:
                                //                                         FontWeight
                                //                                             .w500,
                                //                                   ),
                                //                                   hintText:
                                //                                       'Add Headline',
                                //                                 ),
                                //                               ),
                                //                             ),
                                //                             SizedBox(
                                //                                 child:
                                //                                     Image.asset(
                                //                               AssetRes.edit,
                                //                               height: 20,
                                //                               width: 20,
                                //                               color: Colors
                                //                                   .black
                                //                                   .withOpacity(
                                //                                       0.8),
                                //                             )),
                                //                           ],
                                //                         ),
                                //                       ),
                                //                       const SizedBox(
                                //                         height: 10,
                                //                       ),
                                //                       Container(
                                //                         height: height * 0.06,
                                //                         width: width * 1.3,
                                //                         decoration:
                                //                             BoxDecoration(
                                //                           color: ColorRes
                                //                               .appColor
                                //                               .withOpacity(0.1),
                                //                           borderRadius:
                                //                               BorderRadius
                                //                                   .circular(
                                //                             5,
                                //                           ),
                                //                           border: Border.all(
                                //                               color: ColorRes
                                //                                   .appColor,
                                //                               width: border),
                                //                         ),
                                //                         child: Row(
                                //                           children: [
                                //                             SizedBox(
                                //                               width:
                                //                                   width * 1.15,
                                //                               child: TextField(
                                //                                 controller:
                                //                                     dashboardController
                                //                                         .editChannelC,
                                //                                 style:
                                //                                     TextStyle(
                                //                                   fontFamily:
                                //                                       "sfPro",
                                //                                   color: Colors
                                //                                       .black
                                //                                       .withOpacity(
                                //                                           0.8),
                                //                                   fontWeight:
                                //                                       FontWeight
                                //                                           .w500,
                                //                                 ),
                                //                                 decoration:
                                //                                     InputDecoration(
                                //                                   border:
                                //                                       InputBorder
                                //                                           .none,
                                //                                   contentPadding:
                                //                                       EdgeInsets
                                //                                           .only(
                                //                                     left: width *
                                //                                         0.08,
                                //                                     bottom:
                                //                                         height *
                                //                                             0.023,
                                //                                   ),
                                //                                   hintStyle:
                                //                                       TextStyle(
                                //                                     fontFamily:
                                //                                         "sfPro",
                                //                                     color: Colors
                                //                                         .black
                                //                                         .withOpacity(
                                //                                             0.6),
                                //                                     fontWeight:
                                //                                         FontWeight
                                //                                             .w500,
                                //                                   ),
                                //                                   hintText:
                                //                                       'Add Your Channel name',
                                //                                 ),
                                //                               ),
                                //                             ),
                                //                             SizedBox(
                                //                                 child:
                                //                                     Image.asset(
                                //                               AssetRes.edit,
                                //                               height: 20,
                                //                               width: 20,
                                //                               color: Colors
                                //                                   .black
                                //                                   .withOpacity(
                                //                                       0.8),
                                //                             )),
                                //                           ],
                                //                         ),
                                //                       ),
                                //                       const SizedBox(
                                //                         height: 10,
                                //                       ),
                                //                       Row(
                                //                         mainAxisAlignment:
                                //                             MainAxisAlignment
                                //                                 .center,
                                //                         children: [
                                //                           Container(
                                //                             height:
                                //                                 height * 0.06,
                                //                             width: width * 0.6,
                                //                             decoration:
                                //                                 BoxDecoration(
                                //                               color: ColorRes
                                //                                   .appColor
                                //                                   .withOpacity(
                                //                                       0.1),
                                //                               borderRadius:
                                //                                   BorderRadius
                                //                                       .circular(
                                //                                 5,
                                //                               ),
                                //                               border: Border.all(
                                //                                   color: ColorRes
                                //                                       .appColor,
                                //                                   width:
                                //                                       border),
                                //                             ),
                                //                             child: TextField(
                                //                               controller:
                                //                                   dashboardController
                                //                                       .editDateC,
                                //                               style: TextStyle(
                                //                                 fontFamily:
                                //                                     "sfPro",
                                //                                 color: Colors
                                //                                     .black
                                //                                     .withOpacity(
                                //                                         0.8),
                                //                                 fontWeight:
                                //                                     FontWeight
                                //                                         .w500,
                                //                               ),
                                //                               decoration:
                                //                                   InputDecoration(
                                //                                 border:
                                //                                     InputBorder
                                //                                         .none,
                                //                                 contentPadding:
                                //                                     EdgeInsets
                                //                                         .only(
                                //                                   left: width *
                                //                                       0.08,
                                //                                   bottom:
                                //                                       height *
                                //                                           0.023,
                                //                                 ),
                                //                                 hintStyle:
                                //                                     TextStyle(
                                //                                   fontFamily:
                                //                                       "sfPro",
                                //                                   color: Colors
                                //                                       .black
                                //                                       .withOpacity(
                                //                                           0.6),
                                //                                   fontWeight:
                                //                                       FontWeight
                                //                                           .w500,
                                //                                 ),
                                //                                 hintText:
                                //                                     'Add date',
                                //                               ),
                                //                             ),
                                //                           ),
                                //                           SizedBox(
                                //                               width:
                                //                                   width * 0.1),
                                //                           Container(
                                //                             height:
                                //                                 height * 0.06,
                                //                             width: width * 0.6,
                                //                             decoration:
                                //                                 BoxDecoration(
                                //                               color: ColorRes
                                //                                   .appColor
                                //                                   .withOpacity(
                                //                                       0.1),
                                //                               borderRadius:
                                //                                   BorderRadius
                                //                                       .circular(
                                //                                 5,
                                //                               ),
                                //                               border: Border.all(
                                //                                   color: ColorRes
                                //                                       .appColor,
                                //                                   width:
                                //                                       border),
                                //                             ),
                                //                             child: TextField(
                                //                               controller:
                                //                                   dashboardController
                                //                                       .editTimeC,
                                //                               style: TextStyle(
                                //                                 fontFamily:
                                //                                     "sfPro",
                                //                                 color: Colors
                                //                                     .black
                                //                                     .withOpacity(
                                //                                         0.8),
                                //                                 fontWeight:
                                //                                     FontWeight
                                //                                         .w500,
                                //                               ),
                                //                               decoration:
                                //                                   InputDecoration(
                                //                                 border:
                                //                                     InputBorder
                                //                                         .none,
                                //                                 contentPadding:
                                //                                     EdgeInsets
                                //                                         .only(
                                //                                   left: width *
                                //                                       0.08,
                                //                                   bottom:
                                //                                       height *
                                //                                           0.023,
                                //                                 ),
                                //                                 hintStyle:
                                //                                     TextStyle(
                                //                                   fontFamily:
                                //                                       "sfPro",
                                //                                   color: Colors
                                //                                       .black
                                //                                       .withOpacity(
                                //                                           0.6),
                                //                                   fontWeight:
                                //                                       FontWeight
                                //                                           .w500,
                                //                                 ),
                                //                                 hintText:
                                //                                     'Add Time',
                                //                               ),
                                //                             ),
                                //                           ),
                                //                         ],
                                //                       ),
                                //                       const SizedBox(
                                //                         height: 10,
                                //                       ),
                                //                       Container(
                                //                         height: height * 0.06,
                                //                         width: width * 1.3,
                                //                         decoration:
                                //                             BoxDecoration(
                                //                           color: ColorRes
                                //                               .appColor
                                //                               .withOpacity(0.1),
                                //                           borderRadius:
                                //                               BorderRadius
                                //                                   .circular(
                                //                             5,
                                //                           ),
                                //                           border: Border.all(
                                //                               color: ColorRes
                                //                                   .appColor,
                                //                               width: border),
                                //                         ),
                                //                         child: Row(
                                //                           children: [
                                //                             SizedBox(
                                //                               width:
                                //                                   width * 1.15,
                                //                               child: TextField(
                                //                                 controller:
                                //                                     dashboardController
                                //                                         .editStateC,
                                //                                 style:
                                //                                     TextStyle(
                                //                                   fontFamily:
                                //                                       "sfPro",
                                //                                   color: Colors
                                //                                       .black
                                //                                       .withOpacity(
                                //                                           0.8),
                                //                                   fontWeight:
                                //                                       FontWeight
                                //                                           .w500,
                                //                                 ),
                                //                                 decoration:
                                //                                     InputDecoration(
                                //                                   border:
                                //                                       InputBorder
                                //                                           .none,
                                //                                   contentPadding:
                                //                                       EdgeInsets
                                //                                           .only(
                                //                                     left: width *
                                //                                         0.08,
                                //                                     bottom:
                                //                                         height *
                                //                                             0.023,
                                //                                   ),
                                //                                   hintStyle:
                                //                                       TextStyle(
                                //                                     fontFamily:
                                //                                         "sfPro",
                                //                                     color: Colors
                                //                                         .black
                                //                                         .withOpacity(
                                //                                             0.6),
                                //                                     fontWeight:
                                //                                         FontWeight
                                //                                             .w500,
                                //                                   ),
                                //                                   hintText:
                                //                                       'Add which state....',
                                //                                 ),
                                //                               ),
                                //                             ),
                                //                             SizedBox(
                                //                                 child:
                                //                                     Image.asset(
                                //                               AssetRes.edit,
                                //                               height: 20,
                                //                               width: 20,
                                //                               color: Colors
                                //                                   .black
                                //                                   .withOpacity(
                                //                                       0.8),
                                //                             )),
                                //                           ],
                                //                         ),
                                //                       ),
                                //                       SizedBox(
                                //                         height: 10,
                                //                       ),
                                //                       Container(
                                //                         height: height * 0.06,
                                //                         width: width * 1.3,
                                //                         decoration:
                                //                             BoxDecoration(
                                //                           color: ColorRes
                                //                               .appColor
                                //                               .withOpacity(0.1),
                                //                           borderRadius:
                                //                               BorderRadius
                                //                                   .circular(
                                //                             5,
                                //                           ),
                                //                           border: Border.all(
                                //                               color: ColorRes
                                //                                   .appColor,
                                //                               width: border),
                                //                         ),
                                //                         child: Row(
                                //                           children: [
                                //                             SizedBox(
                                //                               width:
                                //                                   width * 1.15,
                                //                               child: TextField(
                                //                                 controller:
                                //                                     dashboardController
                                //                                         .editCityC,
                                //                                 style:
                                //                                     TextStyle(
                                //                                   fontFamily:
                                //                                       "sfPro",
                                //                                   color: Colors
                                //                                       .black
                                //                                       .withOpacity(
                                //                                           0.8),
                                //                                   fontWeight:
                                //                                       FontWeight
                                //                                           .w500,
                                //                                 ),
                                //                                 decoration:
                                //                                     InputDecoration(
                                //                                   border:
                                //                                       InputBorder
                                //                                           .none,
                                //                                   contentPadding:
                                //                                       EdgeInsets
                                //                                           .only(
                                //                                     left: width *
                                //                                         0.08,
                                //                                     bottom:
                                //                                         height *
                                //                                             0.023,
                                //                                   ),
                                //                                   hintStyle:
                                //                                       TextStyle(
                                //                                     fontFamily:
                                //                                         "sfPro",
                                //                                     color: Colors
                                //                                         .black
                                //                                         .withOpacity(
                                //                                             0.6),
                                //                                     fontWeight:
                                //                                         FontWeight
                                //                                             .w500,
                                //                                   ),
                                //                                   hintText:
                                //                                       'Add which city...',
                                //                                 ),
                                //                               ),
                                //                             ),
                                //                             SizedBox(
                                //                                 child:
                                //                                     Image.asset(
                                //                               AssetRes.edit,
                                //                               height: 20,
                                //                               width: 20,
                                //                               color: Colors
                                //                                   .black
                                //                                   .withOpacity(
                                //                                       0.8),
                                //                             )),
                                //                           ],
                                //                         ),
                                //                       ),
                                //                       SizedBox(
                                //                         height: 10,
                                //                       ),
                                //                       Container(
                                //                         height: height * 0.24,
                                //                         width: width * 1.3,
                                //                         decoration:
                                //                             BoxDecoration(
                                //                           color: ColorRes
                                //                               .appColor
                                //                               .withOpacity(0.1),
                                //                           borderRadius:
                                //                               BorderRadius
                                //                                   .circular(
                                //                             5,
                                //                           ),
                                //                           border: Border.all(
                                //                               color: ColorRes
                                //                                   .appColor,
                                //                               width: border),
                                //                         ),
                                //                         child: Column(
                                //                           children: [
                                //                             Row(
                                //                               children: [
                                //                                 SizedBox(
                                //                                   width: width *
                                //                                       1.15,
                                //                                   child:
                                //                                       TextField(
                                //                                     controller:
                                //                                         dashboardController
                                //                                             .editTopicC,
                                //                                     style:
                                //                                         TextStyle(
                                //                                       fontFamily:
                                //                                           "sfPro",
                                //                                       color: Colors
                                //                                           .black
                                //                                           .withOpacity(
                                //                                               0.8),
                                //                                       fontWeight:
                                //                                           FontWeight
                                //                                               .w500,
                                //                                     ),
                                //                                     decoration:
                                //                                         InputDecoration(
                                //                                       border: InputBorder
                                //                                           .none,
                                //                                       contentPadding:
                                //                                           EdgeInsets
                                //                                               .only(
                                //                                         left: width *
                                //                                             0.08,
                                //                                         bottom: height *
                                //                                             0.023,
                                //                                       ),
                                //                                       hintStyle:
                                //                                           TextStyle(
                                //                                         fontFamily:
                                //                                             "sfPro",
                                //                                         color: Colors
                                //                                             .black
                                //                                             .withOpacity(0.6),
                                //                                         fontWeight:
                                //                                             FontWeight.w500,
                                //                                       ),
                                //                                       hintText:
                                //                                           'Add Topic...',
                                //                                     ),
                                //                                   ),
                                //                                 ),
                                //                                 SizedBox(
                                //                                     child: Image
                                //                                         .asset(
                                //                                   AssetRes.edit,
                                //                                   height: 20,
                                //                                   width: 20,
                                //                                   color: Colors
                                //                                       .black
                                //                                       .withOpacity(
                                //                                           0.8),
                                //                                 )),
                                //                               ],
                                //                             ),
                                //                             Container(
                                //                               margin: EdgeInsets
                                //                                   .symmetric(
                                //                                       horizontal:
                                //                                           10),
                                //                               padding:
                                //                                   EdgeInsets
                                //                                       .all(10),
                                //                               height:
                                //                                   height * 0.15,
                                //                               width:
                                //                                   width * 1.3,
                                //                               decoration:
                                //                                   BoxDecoration(
                                //                                 color: Colors
                                //                                     .white,
                                //                                 borderRadius:
                                //                                     BorderRadius
                                //                                         .circular(
                                //                                   5,
                                //                                 ),
                                //                                 border: Border.all(
                                //                                     color: ColorRes
                                //                                         .appColor,
                                //                                     width:
                                //                                         border),
                                //                               ),
                                //                               child: Row(
                                //                                 crossAxisAlignment:
                                //                                     CrossAxisAlignment
                                //                                         .end,
                                //                                 children: [
                                //                                   SizedBox(
                                //                                     width:
                                //                                         width *
                                //                                             0.94,
                                //                                     child:
                                //                                         TextField(
                                //                                       maxLines:
                                //                                           10,
                                //                                       controller:
                                //                                           dashboardController
                                //                                               .editDesC,
                                //                                       style:
                                //                                           TextStyle(
                                //                                         fontFamily:
                                //                                             "sfPro",
                                //                                         color: Colors
                                //                                             .black
                                //                                             .withOpacity(0.8),
                                //                                         fontWeight:
                                //                                             FontWeight.w500,
                                //                                       ),
                                //                                       decoration:
                                //                                           InputDecoration(
                                //                                         border:
                                //                                             InputBorder.none,
                                //                                         contentPadding:
                                //                                             EdgeInsets.only(
                                //                                           left: width *
                                //                                               0.08,
                                //                                           bottom:
                                //                                               height * 0.023,
                                //                                         ),
                                //                                         hintStyle:
                                //                                             TextStyle(
                                //                                           fontFamily:
                                //                                               "sfPro",
                                //                                           color: Colors
                                //                                               .black
                                //                                               .withOpacity(0.6),
                                //                                           fontWeight:
                                //                                               FontWeight.w500,
                                //                                         ),
                                //                                         hintText:
                                //                                             'Add description here..',
                                //                                       ),
                                //                                     ),
                                //                                   ),
                                //                                   SizedBox(
                                //                                       child: Image
                                //                                           .asset(
                                //                                     AssetRes
                                //                                         .edit,
                                //                                     height: 20,
                                //                                     width: 20,
                                //                                     color: Colors
                                //                                         .black
                                //                                         .withOpacity(
                                //                                             0.8),
                                //                                   )),
                                //                                 ],
                                //                               ),
                                //                             ),
                                //                           ],
                                //                         ),
                                //                       ),
                                //                     ],
                                //                   ),
                                //                   SizedBox(
                                //                     height: Get.height * 0.05,
                                //                   ),
                                //                   GestureDetector(
                                //                     onTap: () {
                                //                       dashboardController
                                //                               .headline =
                                //                           dashboardController
                                //                               .editHeadlineC
                                //                               .text;
                                //                       dashboardController
                                //                               .description =
                                //                           dashboardController
                                //                               .editDesC.text;
                                //                       dashboardController.time =
                                //                           dashboardController
                                //                               .editTimeC.text;
                                //                       dashboardController
                                //                               .topic =
                                //                           dashboardController
                                //                               .editTopicC.text;
                                //                       dashboardController.date =
                                //                           dashboardController
                                //                               .editDateC.text;
                                //                       dashboardController
                                //                               .state =
                                //                           dashboardController
                                //                               .editStateC.text;
                                //                       dashboardController.city =
                                //                           dashboardController
                                //                               .editCityC.text;
                                //                       dashboardController
                                //                               .channel =
                                //                           dashboardController
                                //                               .editChannelC
                                //                               .text;
                                //
                                //                       Get.back();
                                //                       dashboardController
                                //                           .update(['dash']);
                                //                     },
                                //                     child: Container(
                                //                       decoration: BoxDecoration(
                                //                         color:
                                //                             ColorRes.appColor,
                                //                         borderRadius:
                                //                             BorderRadius
                                //                                 .circular(
                                //                           5,
                                //                         ),
                                //                       ),
                                //                       width: width * 0.7,
                                //                       height: height * 0.07,
                                //                       alignment:
                                //                           Alignment.center,
                                //                       child: Text(
                                //                         "Done",
                                //                         style: TextStyle(
                                //                             fontSize:
                                //                                 height * 0.025,
                                //                             fontWeight:
                                //                                 FontWeight.w600,
                                //                             color:
                                //                                 Colors.white),
                                //                       ),
                                //                     ),
                                //                   ),
                                //                   SizedBox(
                                //                     height: height * 0.02,
                                //                   ),
                                //                 ],
                                //               ),
                                //             ),
                                //           ),
                                //         );
                                //       },
                                //     );
                                //   },
                                // );
                                editNewsPopup(context, width, height,
                                    textHeight, sizingInformation);
                              },
                              child: Image.asset(
                                AssetRes.edit,
                                height: sizingInformation.isMobile ? 15 : 20,
                                width: sizingInformation.isMobile ? 15 : 20,
                                color: ColorRes.appColor,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Edit',
                              style: mediumSf.copyWith(
                                  color: ColorRes.appColor, fontSize: 20),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                AssetRes.delete,
                                height: sizingInformation.isMobile ? 15 : 20,
                                width: sizingInformation.isMobile ? 15 : 20,
                                color: ColorRes.appColor,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Delete',
                              style: mediumSf.copyWith(
                                  color: ColorRes.appColor, fontSize: 20),
                            ),
                          ],
                        )
                      : SizedBox(),
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              dashboardController.isNewsDetail == false
                  ? Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: sizingInformation.isMobile
                              ? 10
                              : Get.height > 1360
                                  ? width * 0.6
                                  : Get.height <= 1360 && Get.height > 1050
                                      ? width * 0.25
                                      : width * 0.3,
                          vertical: Get.height * 0.04),
                      height: Get.height * 0.8,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          gradient:(dashboardController.isNewsAdded == false && dashboardController.isNewsCategory== false) ? LinearGradient(
                              colors: [
                                ColorRes.appColor.withOpacity(0.4),
                                ColorRes.appColor.withOpacity(0.2),
                                ColorRes.appColor.withOpacity(0.1)
                              ],
                              end: AlignmentDirectional.topCenter,
                              begin: AlignmentDirectional.bottomCenter): LinearGradient(colors: [Colors.white,Colors.white]),
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(width: 1, color: ColorRes.appColor)),
                      child: dashboardController.isNewsCategory
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  Strings.news,
                                  style: poppinsBold.copyWith(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                      fontFamily: 'poppinsSemiBold'),
                                ),
                                SizedBox(
                                  height: Get.height * 0.04,
                                ),
                                Expanded(
                                  child: GridView.builder(
                                    itemCount: 9,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: Get.width > 1850
                                          ? 500
                                          : (Get.width > 1520 &&
                                                  Get.height <= 1850)
                                              ? 200
                                              : 20,
                                      childAspectRatio:
                                          Get.width > 850 ? 7.2 : 6,
                                    ),
                                    itemBuilder: (context, index) {
                                      bool isDropDownOpen = dashboardController
                                              .isDrop &&
                                          dashboardController.selectedIndex ==
                                              index;

                                      return GestureDetector(
                                        onTap: () {
                                          if (dashboardController.isDrop) {
                                            dashboardController.isDrop = false;
                                            dashboardController.selectedIndex =
                                                -1;
                                          } else {
                                            dashboardController.isDrop = true;
                                            dashboardController.selectedIndex =
                                                index;
                                          }
                                          dashboardController.update(['dash']);
                                        },
                                        child: Container(
                                          width: Get.width > 1150
                                              ? width * 0.89
                                              : width * 0.6,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: ColorRes.appColor,
                                                width: 1),
                                            borderRadius: BorderRadius.circular(
                                              5,
                                            ),
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: Container(
                                              height: Get.height * 0.07,
                                              width: Get.width,
                                              child: DropdownButton<String>(
                                                padding: EdgeInsets.only(
                                                  right: 20,
                                                  left: Get.width > 1050
                                                      ? width * 0.6
                                                      : width * 0.4,
                                                ),
                                                hint: Center(
                                                  child: Text(
                                                    "Select",
                                                  ),
                                                ),
                                                dropdownColor: Colors.white,
                                                focusColor: ColorRes.appColor
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                value: dashboardController
                                                    .dropValue![index],
                                                icon: Image.asset(
                                                  AssetRes.arrowDown,
                                                  height: 15,
                                                  width: 15,
                                                ),
                                                elevation: 16,
                                                onChanged: (value) {
                                                  dashboardController
                                                      .dropOnChange(
                                                          value, index);
                                                },
                                                items: dashboardController
                                                    .dropItems!
                                                    .map((String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                          // Row(
                                          //   children: [
                                          //     SizedBox(
                                          //       width: Get.width > 1050
                                          //           ? width * 0.6
                                          //           : width * 0.4,
                                          //     ),
                                          //     Text(
                                          //       "politics",
                                          //       style: TextStyle(
                                          //           fontSize: 15,
                                          //           color: Colors.black
                                          //               .withOpacity(0.8)),
                                          //     ),
                                          //     const Spacer(),
                                          //     Image.asset(
                                          //       AssetRes.arrowDown,
                                          //       height: 15,
                                          //       width: 15,
                                          //     ),
                                          //
                                          //     SizedBox(
                                          //       width: width * 0.1,
                                          //     ),
                                          //   ],
                                          // ),
                                        ),
                                      );

                                      // dashboardController.isDrop?  Container(
                                      //        width: Get.width,
                                      //        decoration: BoxDecoration(
                                      //          borderRadius:
                                      //              BorderRadius.circular(10),
                                      //          color: Colors.white.withOpacity(0.16),
                                      //        ),
                                      //        child: SizedBox(
                                      //          child: ListView.separated(
                                      //
                                      //            shrinkWrap: true,
                                      //            itemCount:
                                      //                3,
                                      //            separatorBuilder: (context, index) {
                                      //              return Padding(
                                      //                padding: EdgeInsets.only(
                                      //                  left: width * 0.1,
                                      //                  right: width * 0.1,
                                      //                ),
                                      //                child: Container(
                                      //                  height: 1,
                                      //                  color: Colors.white
                                      //                      .withOpacity(0.5),
                                      //                ),
                                      //              );
                                      //            },
                                      //            itemBuilder: (context, index) {
                                      //              return Column(
                                      //                children: [
                                      //                  InkWell(
                                      //                    onTap: () {
                                      //
                                      //                        dashboardController.isDrop =
                                      //                            false;
                                      //                        dashboardController.update(['dash']);
                                      //
                                      //                    },
                                      //                    child: Container(
                                      //                      height: sizingInformation
                                      //                              .isDesktop
                                      //                          ? height * 0.09
                                      //                          : height * 0.06,
                                      //                      decoration: BoxDecoration(
                                      //                          color:
                                      //              Colors.red,),
                                      //                      child: Row(
                                      //                        mainAxisAlignment:
                                      //                            MainAxisAlignment
                                      //                                .start,
                                      //                        children: [
                                      //                          SizedBox(
                                      //                              width:
                                      //                                  width * 0.1),
                                      //                          Padding(
                                      //                            padding:
                                      //                                EdgeInsets.only(
                                      //                                    left: width *
                                      //                                        0.1),
                                      //                            child: Text(
                                      //                            'hello',
                                      //                              style:  TextStyle(
                                      //                                      color: Colors
                                      //                                          .black,
                                      //                                      fontWeight:
                                      //                                          FontWeight
                                      //                                              .bold,
                                      //                                      fontSize:
                                      //                                          textHeight *
                                      //                                              0.03,
                                      //                                      fontFamily:
                                      //                                          "sfPro",
                                      //                                    )
                                      //
                                      //                            ),
                                      //                          ),
                                      //                        ],
                                      //                      ),
                                      //                    ),
                                      //                  ),
                                      //                ],
                                      //              );
                                      //            },
                                      //          ),
                                      //        )) : SizedBox(),
                                    },
                                  ),
                                )
                              ],
                            )
                          : dashboardController.isNewsAdded
                              ? Column(
                                  children: [
                                    Text(
                                      dashboardController.headline!,
                                      style: mediumSf.copyWith(
                                          fontSize: 27,
                                          fontWeight: FontWeight.w700),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.035,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          dashboardController.channel!,
                                          style:
                                              mediumSf.copyWith(fontSize: 20),
                                        ),
                                        Spacer(),
                                        Text(
                                          dashboardController.city!,
                                          style:
                                              mediumSf.copyWith(fontSize: 20),
                                        ),
                                        Text(
                                          dashboardController.date!,
                                          style:
                                              mediumSf.copyWith(fontSize: 20),
                                        ),
                                        Text(
                                          dashboardController.time!,
                                          style:
                                              mediumSf.copyWith(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.035,
                                    ),
                                    dashboardController.newsImage == null
                                        ? SizedBox()
                                        : Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                5,
                                              ),
                                              border: Border.all(
                                                  color: Colors.white,
                                                  width: 1),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                5,
                                              ),
                                              child: Image.memory(
                                                Uint8List.fromList(
                                                    dashboardController
                                                        .newsImage!),
                                                width: width * 25,
                                                height:
                                                    sizingInformation.isDesktop
                                                        ? height * 0.5
                                                        : height * 0.34,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                    SizedBox(
                                      height: Get.height * 0.025,
                                    ),
                                    Text(
                                      dashboardController.topic!,
                                      style: mediumSf.copyWith(
                                          fontSize: 32,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.025,
                                    ),
                                    Text(
                                      dashboardController.description!,
                                      style: mediumSf.copyWith(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        dashboardController.isNewsCategory =
                                            true;
                                        dashboardController.isNewsAdded = false;
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
                                        height: height * 0.07,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Upload",
                                          style: TextStyle(
                                              fontSize: height * 0.025,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return StatefulBuilder(
                                          builder: (context, updateDialog) {
                                            return BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaX: 2, sigmaY: 2),
                                              child: Dialog(
                                                backgroundColor:
                                                    Colors.transparent,
                                                child: Container(
                                                  // height: height * 0.55,
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
                                                            child: Icon(
                                                              Icons.close,
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.8),
                                                              size: 20,
                                                            ),
                                                            onTap: () {
                                                              Get.back();
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        'Add News detail',
                                                        style: TextStyle(
                                                            height: 1.5,
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.8),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize:
                                                                textHeight *
                                                                    0.04,
                                                            fontFamily: "sfPro",
                                                            letterSpacing: 2),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            Get.height * 0.008,
                                                      ),
                                                      Container(
                                                        height: 1,
                                                        width: width * 0.8,
                                                        color:
                                                            ColorRes.appColor,
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            Get.height * 0.04,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            height: Get.height *
                                                                0.02,
                                                          ),
                                                          dashboardController
                                                                      .imageData ==
                                                                  null
                                                              ? GestureDetector(
                                                                  onTap:
                                                                      () async {
                                                                    await dashboardController
                                                                        .pickImage();
                                                                    updateDialog
                                                                        .call(
                                                                            () {});
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            width *
                                                                                0.3,
                                                                        vertical:
                                                                            width *
                                                                                0.2),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(
                                                                          10,
                                                                        ),
                                                                        color: ColorRes.appColor.withOpacity(
                                                                          0.20,
                                                                        ),
                                                                        border: Border.all(width: 1, color: ColorRes.appColor)),
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      children: [
                                                                        Image
                                                                            .asset(
                                                                          AssetRes
                                                                              .imagePicker,
                                                                          height:
                                                                              height * 0.08,
                                                                          width:
                                                                              height * 0.08,
                                                                        ),
                                                                        Stack(
                                                                          alignment:
                                                                              Alignment.bottomRight,
                                                                          children: [
                                                                            Container(
                                                                              // color: Colors.red,
                                                                              height: height * 0.1,
                                                                              width: height * 0.1,
                                                                            ),
                                                                            Container(
                                                                              height: width * 0.08,
                                                                              width: width * 0.08,
                                                                              decoration: const BoxDecoration(
                                                                                color: Color(0xff55A1FF),
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              alignment: Alignment.center,
                                                                              child: Wrap(
                                                                                children: [
                                                                                  Icon(
                                                                                    Icons.add,
                                                                                    color: Colors.white,
                                                                                    size: width * 0.04,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                )
                                                              : Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                      10,
                                                                    ),
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .white,
                                                                        width:
                                                                            1),
                                                                  ),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                      10,
                                                                    ),
                                                                    child: Image
                                                                        .memory(
                                                                      Uint8List.fromList(
                                                                          dashboardController
                                                                              .imageData!),
                                                                      width:
                                                                          width *
                                                                              0.8,
                                                                      height: sizingInformation
                                                                              .isDesktop
                                                                          ? height *
                                                                              0.24
                                                                          : height *
                                                                              0.14,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                          SizedBox(),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Container(
                                                            height:
                                                                height * 0.06,
                                                            width: width * 1.3,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: ColorRes
                                                                  .appColor
                                                                  .withOpacity(
                                                                      0.1),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                5,
                                                              ),
                                                              border: Border.all(
                                                                  color: ColorRes
                                                                      .appColor,
                                                                  width:
                                                                      border),
                                                            ),
                                                            child: TextField(
                                                              controller:
                                                                  dashboardController
                                                                      .addHeadLineController,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "sfPro",
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.8),
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
                                                                    'Add Headline',
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Container(
                                                            height:
                                                                height * 0.06,
                                                            width: width * 1.3,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: ColorRes
                                                                  .appColor
                                                                  .withOpacity(
                                                                      0.1),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                5,
                                                              ),
                                                              border: Border.all(
                                                                  color: ColorRes
                                                                      .appColor,
                                                                  width:
                                                                      border),
                                                            ),
                                                            child: TextField(
                                                              controller:
                                                                  dashboardController
                                                                      .channelController,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "sfPro",
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.8),
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
                                                                    'Add Your Channel name',
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                height: height *
                                                                    0.06,
                                                                width:
                                                                    width * 0.6,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: ColorRes
                                                                      .appColor
                                                                      .withOpacity(
                                                                          0.1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    5,
                                                                  ),
                                                                  border: Border.all(
                                                                      color: ColorRes
                                                                          .appColor,
                                                                      width:
                                                                          border),
                                                                ),
                                                                child:

                                                                    TextField(
                                                                  controller:
                                                                      dashboardController
                                                                          .dateController,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "sfPro",
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.8),
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
                                                                      bottom: height *
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
                                                                        'Add date',
                                                                  ),
                                                                      onTap: () async {


                                                                          DateTime? pickedDate = await showDatePicker(
                                                                              context: context,
                                                                              initialDate: DateTime.now(),
                                                                              firstDate: DateTime(1950),
                                                                              lastDate: DateTime(2100));

                                                                          if (pickedDate != null) {
                                                                            print(
                                                                                pickedDate);
                                                                            String formattedDate =
                                                                            DateFormat('yyyy-MM-dd').format(pickedDate);
                                                                            print(
                                                                                formattedDate);

                                                                            dashboardController.dateController.text =
                                                                                formattedDate;
                                                                            dashboardController.update(['dash']);
                                                                          } else {


                                                                          }
                                                                      },
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: width *
                                                                      0.1),
                                                              Container(
                                                                height: height *
                                                                    0.06,
                                                                width:
                                                                    width * 0.6,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: ColorRes
                                                                      .appColor
                                                                      .withOpacity(
                                                                          0.1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    5,
                                                                  ),
                                                                  border: Border.all(
                                                                      color: ColorRes
                                                                          .appColor,
                                                                      width:
                                                                          border),
                                                                ),
                                                                child:
                                                                    TextField(
                                                                  controller:
                                                                      dashboardController
                                                                          .timeController,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "sfPro",
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.8),
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
                                                                      bottom: height *
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
                                                                        'Add Time',
                                                                  ),
                                                                      onTap: () async {
                                                                        TimeOfDay? pickedTime =  await showTimePicker(
                                                                          initialTime: TimeOfDay.now(),
                                                                          context: context,
                                                                        );

                                                                        if(pickedTime != null ){



                                                                          String formattedTime = pickedTime.format(context);
                                                                          print(formattedTime);
                                                                          dashboardController.timeController.text = formattedTime;
                                                                          dashboardController.update(['dash']);
                                                                        }else{
                                                                          print("Time is not selected");
                                                                        }
                                                                      },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Container(
                                                            height:
                                                                height * 0.06,
                                                            width: width * 1.3,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: ColorRes
                                                                  .appColor
                                                                  .withOpacity(
                                                                      0.1),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                5,
                                                              ),
                                                              border: Border.all(
                                                                  color: ColorRes
                                                                      .appColor,
                                                                  width:
                                                                      border),
                                                            ),
                                                            child: TextField(
                                                              controller:
                                                                  dashboardController
                                                                      .stateController,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "sfPro",
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.8),
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
                                                                    'Add which state....',
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Container(
                                                            height:
                                                                height * 0.06,
                                                            width: width * 1.3,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: ColorRes
                                                                  .appColor
                                                                  .withOpacity(
                                                                      0.1),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                5,
                                                              ),
                                                              border: Border.all(
                                                                  color: ColorRes
                                                                      .appColor,
                                                                  width:
                                                                      border),
                                                            ),
                                                            child: TextField(
                                                              controller:
                                                                  dashboardController
                                                                      .cityController,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    "sfPro",
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.8),
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
                                                                    'Add which city...',
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Container(
                                                            height:
                                                                height * 0.24,
                                                            width: width * 1.3,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: ColorRes
                                                                  .appColor
                                                                  .withOpacity(
                                                                      0.1),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                5,
                                                              ),
                                                              border: Border.all(
                                                                  color: ColorRes
                                                                      .appColor,
                                                                  width:
                                                                      border),
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                TextField(
                                                                  controller:
                                                                      dashboardController
                                                                          .topicController,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "sfPro",
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.8),
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
                                                                      bottom: height *
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
                                                                        'Add Topic...',
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              10),
                                                                  height:
                                                                      height *
                                                                          0.15,
                                                                  width: width *
                                                                      1.3,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                      5,
                                                                    ),
                                                                    border: Border.all(
                                                                        color: ColorRes
                                                                            .appColor,
                                                                        width:
                                                                            border),
                                                                  ),
                                                                  child:
                                                                      TextField(
                                                                    maxLines: 6,
                                                                    controller:
                                                                        dashboardController
                                                                            .desController,
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          "sfPro",
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.8),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                    decoration:
                                                                        InputDecoration(
                                                                      border: InputBorder
                                                                          .none,
                                                                      contentPadding:
                                                                          EdgeInsets
                                                                              .only(
                                                                        left: width *
                                                                            0.08,
                                                                        bottom: height *
                                                                            0.023,
                                                                      ),
                                                                      hintStyle:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            "sfPro",
                                                                        color: Colors
                                                                            .black
                                                                            .withOpacity(0.6),
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                      hintText:
                                                                          'Add description here..',
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
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
                                                          if (dashboardController.addHeadLineController.text.isNotEmpty &&
                                                              dashboardController
                                                                  .channelController
                                                                  .text
                                                                  .isNotEmpty &&
                                                              dashboardController
                                                                  .cityController
                                                                  .text
                                                                  .isNotEmpty &&
                                                              dashboardController
                                                                  .dateController
                                                                  .text
                                                                  .isNotEmpty &&
                                                              dashboardController
                                                                  .timeController
                                                                  .text
                                                                  .isNotEmpty &&
                                                              dashboardController
                                                                  .topicController
                                                                  .text
                                                                  .isNotEmpty &&
                                                              dashboardController
                                                                  .desController
                                                                  .text
                                                                  .isNotEmpty &&
                                                              dashboardController
                                                                      .imageData !=
                                                                  null) {
                                                            dashboardController
                                                                    .isNewsAdded =
                                                                true;
                                                            dashboardController
                                                                    .headline =
                                                                dashboardController
                                                                    .addHeadLineController
                                                                    .text;
                                                            dashboardController
                                                                    .channel =
                                                                dashboardController
                                                                    .channelController
                                                                    .text;
                                                            dashboardController
                                                                    .city =
                                                                dashboardController
                                                                    .cityController
                                                                    .text;
                                                            dashboardController
                                                                    .date =
                                                                dashboardController
                                                                    .dateController
                                                                    .text;
                                                            dashboardController
                                                                    .time =
                                                                dashboardController
                                                                    .timeController
                                                                    .text;
                                                            dashboardController
                                                                    .topic =
                                                                dashboardController
                                                                    .topicController
                                                                    .text;
                                                            dashboardController
                                                                    .description =
                                                                dashboardController
                                                                    .desController
                                                                    .text;
                                                            dashboardController
                                                                    .newsImage =
                                                                dashboardController
                                                                    .imageData;

                                                            Get.back();
                                                            dashboardController
                                                                .update(
                                                                    ['dash']);
                                                          } else {
                                                            Get.snackbar(
                                                                'Error',
                                                                'Please enter all fields');
                                                          }

                                                          dashboardController
                                                              .update(['dash']);
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
                                                          height: height * 0.07,
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            "Next",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    height *
                                                                        0.025,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .white),
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
                                    );
                                  },
                                  child: Container(
                                    height:
                                        sizingInformation.isDesktop ? 50 : 40,
                                    width: width * 0.7,
                                    decoration: BoxDecoration(
                                        color: ColorRes.appColor,
                                        borderRadius: BorderRadius.circular(5)),
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
                                ),
                    )
                  : NewsDetail(),
            ],
          ),
        );
      }),
    );
  }
}
