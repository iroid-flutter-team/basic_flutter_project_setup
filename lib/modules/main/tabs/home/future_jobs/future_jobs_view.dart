import 'package:align_flutter_app/modules/main/tabs/home/home_view_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../../shared/constants/color_constants.dart';
import '../../../../../shared/constants/png_image_constant.dart';
import '../../../../../shared/constants/svg_image_constant.dart';
import '../../../../../shared/utils/math_utils.dart';
import '../../../../../shared/widgets/base_elevated_button.dart';
import '../../../../../shared/widgets/base_text.dart';
import '../../../../../shared/widgets/common_appbar.dart';
import '../../../../../shared/widgets/common_container_shadow.dart';

class FutureJobsView extends GetView<HomeController> {
  const FutureJobsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "Future jobs",
      ),
      body: _buildMainBody(),
    );
  }

  _buildMainBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Image.asset(
            PngImageConstants.futureJobs,
            height: getSize(146),
          ),
          SizedBox(
            height: getSize(50),
          ),
          BaseText(
            text: "All done! The future is yours.",
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: getSize(14),
          ),
          BaseText(
            textAlign: TextAlign.center,
            text:
                "More jobs for you will be shown here as they are\nadded, so check back soon",
            fontSize: 12,
            textColor: ColorConstants.white.withOpacity(0.6),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getSize(30)),
            child: BaseElevatedButton(
              width: Get.width,
              onPressed: () {
                Get.until((route) => route.isFirst);
              },
              child: BaseText(
                text: "GO TO DASHBOARD",
              ),
            ),
          ),
          SizedBox(
            height: getSize(40),
          ),
        ],
      ),
    );
  }

  // _buildMainBody() {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(horizontal: getSize(25)),
  //     child: ListView(
  //       children: [
  //         SizedBox(
  //           height: getSize(20),
  //         ),
  //         BaseText(
  //           textAlign: TextAlign.center,
  //           text: "29/04/2022",
  //           fontSize: 10,
  //           fontWeight: FontWeight.w600,
  //           textColor: ColorConstants.white.withOpacity(0.8),
  //         ),
  //         _buildListView(),
  //       ],
  //     ),
  //   );
  // }
  //
  // _buildListView() {
  //   return ListView.builder(
  //     physics: BouncingScrollPhysics(),
  //     shrinkWrap: true,
  //     itemCount: controller.jobsResponse.value.futureJobs?.length,
  //     itemBuilder: (context, index) {
  //       return Padding(
  //         padding: EdgeInsets.only(top: getSize(30)),
  //         child: CommonContainerWithShadow(
  //           child: Padding(
  //             padding: EdgeInsets.only(
  //               left: getSize(20),
  //               right: getSize(20),
  //               top: getSize(14),
  //               bottom: getSize(20),
  //             ),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Row(
  //                   children: [
  //                     Image.asset(
  //                       PngImageConstants.user,
  //                       height: getSize(24),
  //                     ),
  //                     SizedBox(
  //                       width: getSize(20),
  //                     ),
  //                     BaseText(
  //                       text: controller.jobsResponse.value.todayJobs![index]
  //                               .user?.fullname
  //                               .toString() ??
  //                           "",
  //                       fontSize: 14,
  //                       fontWeight: FontWeight.w600,
  //                     ),
  //                     Spacer(),
  //                     InkWell(
  //                       onTap: () {
  //                         Get.toNamed(Routes.MESSAGE);
  //                       },
  //                       child: SvgPicture.asset(
  //                         SvgImageConstants.message,
  //                         height: getSize(24),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   height: getSize(30),
  //                 ),
  //                 Row(
  //                   children: [
  //                     BaseText(
  //                       text: "Date",
  //                       fontWeight: FontWeight.w500,
  //                       fontSize: 10,
  //                       textColor: ColorConstants.white.withOpacity(0.6),
  //                     ),
  //                     SizedBox(
  //                       width: getSize(74),
  //                     ),
  //                     BaseText(
  //                       text: "Time",
  //                       fontWeight: FontWeight.w500,
  //                       fontSize: 10,
  //                       textColor: ColorConstants.white.withOpacity(0.6),
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   height: getSize(4),
  //                 ),
  //                 Row(
  //                   children: [
  //                     BaseText(
  //                       text: DateFormat('dd/MM/yyyy').format(
  //                         DateTime.fromMillisecondsSinceEpoch(controller
  //                                 .jobsResponse
  //                                 .value
  //                                 .todayJobs![index]
  //                                 .inspectionDate
  //                                 ?.toInt() ??
  //                             0),
  //                       ),
  //                       fontWeight: FontWeight.w600,
  //                       fontSize: 12,
  //                     ),
  //                     SizedBox(
  //                       width: getSize(32),
  //                     ),
  //                     BaseText(
  //                       text: "09:00 AM",
  //                       fontWeight: FontWeight.w600,
  //                       fontSize: 12,
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   height: getSize(10),
  //                 ),
  //                 BaseText(
  //                   text: "Place",
  //                   fontWeight: FontWeight.w500,
  //                   fontSize: 10,
  //                   textColor: ColorConstants.white.withOpacity(0.6),
  //                 ),
  //                 SizedBox(
  //                   height: getSize(4),
  //                 ),
  //                 Row(
  //                   children: [
  //                     SvgPicture.asset(
  //                       SvgImageConstants.location,
  //                     ),
  //                     SizedBox(
  //                       width: getSize(7),
  //                     ),
  //                     BaseText(
  //                       text: controller.jobsResponse.value.todayJobs![index]
  //                               .user?.address
  //                               .toString() ??
  //                           "",
  //                       fontWeight: FontWeight.w600,
  //                       fontSize: 12,
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   height: getSize(40),
  //                 ),
  //                 BaseElevatedButton(
  //                   width: Get.width,
  //                   height: getSize(32),
  //                   onPressed: () {
  //                     Get.toNamed(Routes.EXAMINATION);
  //                     // Get.off(
  //                     //   ExaminationView(),
  //                     //   binding: ExaminationBindings(),
  //                     // );
  //                   },
  //                   child: BaseText(
  //                     text: "Start Examination",
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

}
