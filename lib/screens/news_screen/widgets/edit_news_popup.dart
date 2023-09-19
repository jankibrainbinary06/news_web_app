import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_web_app/screens/dashboard_screen/dashboard_controller.dart';
import 'package:news_web_app/utils/assets_res.dart';

import '../../../utils/color_res.dart';
DashboardController dashboardController = Get.put(DashboardController());
 editNewsPopup(
  BuildContext context , double width, double height, double textHeight,var sizingInformation,
) {
  return  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, updateDialog) {
          return BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 2, sigmaY: 2),
            child: Dialog(
              backgroundColor: Colors.transparent,
              child: Container(
                // height: height * 0.55,
                width: width * 2,
                padding:
                const EdgeInsets.symmetric(
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
                      MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          child: Icon(
                            Icons.close,
                            color: Colors.black
                                .withOpacity(0.8),
                            size: 20,
                          ),
                          onTap: () {
                            Get.back();
                          },
                        ),
                      ],
                    ),
                    Text(
                      'Edit News detail',
                      style: TextStyle(
                          height: 1.5,
                          color: Colors.black
                              .withOpacity(0.8),
                          fontWeight:
                          FontWeight.w600,
                          fontSize:
                          textHeight! * 0.04,
                          fontFamily: "sfPro",
                          letterSpacing: 2),
                    ),
                    SizedBox(
                      height: Get.height * 0.008,
                    ),
                    Container(
                      height: 1,
                      width: width * 0.8,
                      color: ColorRes.appColor,
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .center,
                      children: [
                        SizedBox(
                          height:
                          Get.height * 0.02,
                        ),
                        dashboardController
                            .newsImage ==
                            null
                            ? const SizedBox()
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
                                width: 1),
                          ),
                          child: ClipRRect(
                            borderRadius:
                            BorderRadius
                                .circular(
                              10,
                            ),
                            child: Image
                                .memory(
                              Uint8List.fromList(
                                  dashboardController
                                      .newsImage!),
                              width: width *
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
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          // height: height * 0.06,
                          width: width * 1.3,
                          decoration:
                          BoxDecoration(
                            color: ColorRes
                                .appColor
                                .withOpacity(0.1),
                            borderRadius:
                            BorderRadius
                                .circular(
                              5,
                            ),
                            border: Border.all(
                                color: ColorRes
                                    .appColor,
                                width: 1),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width:
                                width * 1.15,
                                child: TextField(
                                  maxLines: 2,
                                  controller:
                                  dashboardController
                                      .editHeadlineC,
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
                              SizedBox(
                                  child:
                                  Image.asset(
                                    AssetRes.edit,
                                    height: 20,
                                    width: 20,
                                    color: Colors
                                        .black
                                        .withOpacity(
                                        0.8),
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: height * 0.06,
                          width: width * 1.3,
                          decoration:
                          BoxDecoration(
                            color: ColorRes
                                .appColor
                                .withOpacity(0.1),
                            borderRadius:
                            BorderRadius
                                .circular(
                              5,
                            ),
                            border: Border.all(
                                color: ColorRes
                                    .appColor,
                                width: 1),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width:
                                width * 1.15,
                                child: TextField(
                                  controller:
                                  dashboardController
                                      .editChannelC,
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
                              SizedBox(
                                  child:
                                  Image.asset(
                                    AssetRes.edit,
                                    height: 20,
                                    width: 20,
                                    color: Colors
                                        .black
                                        .withOpacity(
                                        0.8),
                                  )),
                            ],
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
                              height:
                              height * 0.06,
                              width: width * 0.6,
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
                                    1),
                              ),
                              child: TextField(
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

                                    dashboardController.editDateC.text =
                                        formattedDate;
                                    dashboardController.update(['dash']);
                                  } else {


                                  }
                                },
                                controller:
                                dashboardController
                                    .editDateC,
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
                                  'Add date',
                                ),
                              ),
                            ),
                            SizedBox(
                                width:
                                width * 0.1),
                            Container(
                              height:
                              height * 0.06,
                              width: width * 0.6,
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
                                    1),
                              ),
                              child: TextField(
                                onTap: () async {
                                  TimeOfDay? pickedTime =  await showTimePicker(
                                    initialTime: TimeOfDay.now(),
                                    context: context,
                                  );

                                  if(pickedTime != null ){

                                    String formattedTime = pickedTime.format(context);
                                    print(formattedTime);
                                    dashboardController.editTimeC.text = formattedTime;
                                    dashboardController.update(['dash']);
                                  }else{
                                    print("Time is not selected");
                                  }
                                },
                                controller:
                                dashboardController
                                    .editTimeC,
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
                                  'Add Time',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: height * 0.06,
                          width: width * 1.3,
                          decoration:
                          BoxDecoration(
                            color: ColorRes
                                .appColor
                                .withOpacity(0.1),
                            borderRadius:
                            BorderRadius
                                .circular(
                              5,
                            ),
                            border: Border.all(
                                color: ColorRes
                                    .appColor,
                                width: 1),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width:
                                width * 1.15,
                                child: TextField(
                                  controller:
                                  dashboardController
                                      .editStateC,
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
                                  child:
                                  Image.asset(
                                    AssetRes.edit,
                                    height: 20,
                                    width: 20,
                                    color: Colors
                                        .black
                                        .withOpacity(
                                        0.8),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: height * 0.06,
                          width: width * 1.3,
                          decoration:
                          BoxDecoration(
                            color: ColorRes
                                .appColor
                                .withOpacity(0.1),
                            borderRadius:
                            BorderRadius
                                .circular(
                              5,
                            ),
                            border: Border.all(
                                color: ColorRes
                                    .appColor,
                                width: 1),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width:
                                width * 1.15,
                                child: TextField(
                                  controller:
                                  dashboardController
                                      .editCityC,
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
                                  child:
                                  Image.asset(
                                    AssetRes.edit,
                                    height: 20,
                                    width: 20,
                                    color: Colors
                                        .black
                                        .withOpacity(
                                        0.8),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: height * 0.24,
                          width: width * 1.3,
                          decoration:
                          BoxDecoration(
                            color: ColorRes
                                .appColor
                                .withOpacity(0.1),
                            borderRadius:
                            BorderRadius
                                .circular(
                              5,
                            ),
                            border: Border.all(
                                color: ColorRes
                                    .appColor,
                                width: 1),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: width *
                                        1.15,
                                    child:
                                    TextField(
                                      controller:
                                      dashboardController
                                          .editTopicC,
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
                                        'Add Topic...',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      child: Image
                                          .asset(
                                        AssetRes.edit,
                                        height: 20,
                                        width: 20,
                                        color: Colors
                                            .black
                                            .withOpacity(
                                            0.8),
                                      )),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets
                                    .symmetric(
                                    horizontal:
                                    10),
                                padding:
                                EdgeInsets
                                    .all(10),
                                height:
                                height * 0.15,
                                width:
                                width * 1.3,
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
                                      1),
                                ),
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .end,
                                  children: [
                                    SizedBox(
                                      width:
                                      width *
                                          0.94,
                                      child:
                                      TextField(
                                        maxLines:
                                        10,
                                        controller:
                                        dashboardController
                                            .editDesC,
                                        style:
                                        TextStyle(
                                          fontFamily:
                                          "sfPro",
                                          color: Colors
                                              .black
                                              .withOpacity(0.8),
                                          fontWeight:
                                          FontWeight.w500,
                                        ),
                                        decoration:
                                        InputDecoration(
                                          border:
                                          InputBorder.none,
                                          contentPadding:
                                          EdgeInsets.only(
                                            left: width *
                                                0.08,
                                            bottom:
                                            height * 0.023,
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
                                    SizedBox(
                                        child: Image
                                            .asset(
                                          AssetRes
                                              .edit,
                                          height: 20,
                                          width: 20,
                                          color: Colors
                                              .black
                                              .withOpacity(
                                              0.8),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                    GestureDetector(
                      onTap: () {
                        dashboardController
                            .headline =
                            dashboardController
                                .editHeadlineC
                                .text;
                        dashboardController
                            .description =
                            dashboardController
                                .editDesC.text;
                        dashboardController.time =
                            dashboardController
                                .editTimeC.text;
                        dashboardController
                            .topic =
                            dashboardController
                                .editTopicC.text;
                        dashboardController.date =
                            dashboardController
                                .editDateC.text;
                        dashboardController
                            .state =
                            dashboardController
                                .editStateC.text;
                        dashboardController.city =
                            dashboardController
                                .editCityC.text;
                        dashboardController
                            .channel =
                            dashboardController
                                .editChannelC
                                .text;

                        Get.back();
                        dashboardController
                            .update(['dash']);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                          ColorRes.appColor,
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
                          "Done",
                          style: TextStyle(
                              fontSize:
                              height * 0.025,
                              fontWeight:
                              FontWeight.w600,
                              color:
                              Colors.white),
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
}
