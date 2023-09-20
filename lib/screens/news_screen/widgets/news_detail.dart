import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_web_app/screens/news_screen/widgets/delete_popup.dart';
import 'package:news_web_app/screens/news_screen/widgets/edit_news_popup.dart';
import 'package:news_web_app/screens/news_screen/widgets/news_detail_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../common/text_styles.dart';
import '../../../utils/assets_res.dart';
import '../../../utils/color_res.dart';

class NewsDetail extends StatelessWidget {
  const NewsDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = 0;
    double height = 0;
    double textHeight = 0;
    double border = 0;
    bool isMobile = false;
    NewsDetailController newsDetailController = Get.put(NewsDetailController());
    return           ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
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
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1, color: ColorRes.appColor)),
          child:  SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "ISRO releases images of the Earth and Moon taken by cameras on board Chandrayaan-3 spacecraft",
                  style: mediumSf.copyWith(
                      fontSize: 27, fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: Get.height * 0.035,
                ),
                Row(
                  children: [
                    Text(
                      'The Hindu News',
                      style: mediumSf.copyWith(fontSize: 20),
                    ),
                    Spacer(),
                    Text(
                      'surat',
                      style: mediumSf.copyWith(fontSize: 20),
                    ),
                    Text(
                      'Aug10, 2023 ',
                      style: mediumSf.copyWith(fontSize: 20),
                    ),
                    Text(
                      ' 11:01 am ',
                      style: mediumSf.copyWith(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.035,
                ),
         Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                    border: Border.all(
                        color: Colors.white, width: 1),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                    child: Image.asset(
                     AssetRes.imagePicker,
                      width: width * 25,
                      height: sizingInformation.isDesktop
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
                  'Chandrayaan-3 Mission',
                  style: mediumSf.copyWith(
                      fontSize: 32, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                Text(
                  'Chandrayaan-3 is successfully inserted into the lunar orbit. The orbit achieved is 164 km x 18074 km, as intended. The spacecraft is inserted into the translunar orbit. The orbit achieved is 288 km x 369328 km.',
                  style: mediumSf.copyWith(
                      fontSize: 22, fontWeight: FontWeight.w400),
                ),
                // Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {

                        editNewsPopup(context, width, height, textHeight, sizingInformation);
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
                      onTap: () {
                        deleteNews(context, width, height, textHeight, sizingInformation);
                      },
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
                ),
              ],
            ),
          ),

        );
      },

    );
  }
}
