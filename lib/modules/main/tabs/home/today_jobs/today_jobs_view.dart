import 'package:align_flutter_app/models/response/home/job_response.dart';
import 'package:align_flutter_app/modules/main/tabs/home/home_view_controller.dart';
import 'package:align_flutter_app/modules/main/tabs/home/today_jobs/today_jobs_controller.dart';
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

class TodayJobsView extends GetView<TodayJobsController> {
  // final List<TodayJobs> listData;
  const TodayJobsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Today jobs',
      ),
      body: _buildMainBody(),
    );
  }

  _buildMainBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getSize(25)),
      child: ListView(
        children: [
          SizedBox(
            height: getSize(20),
          ),
          BaseText(
            textAlign: TextAlign.center,
            text: "29/04/2022",
            // DateFormat('dd/MM/yyyy').format(
            //   DateTime.fromMillisecondsSinceEpoch(
            //       controller.listData[0].inspectionDate?.toInt() ?? 0),),
            fontSize: 10,
            fontWeight: FontWeight.w600,
            textColor: ColorConstants.white.withOpacity(0.8),
          ),
          _buildListView(),
        ],
      ),
    );
  }

  _buildListView() {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.listData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: getSize(30)),
          child: CommonContainerWithShadow(
            child: Padding(
              padding: EdgeInsets.only(
                left: getSize(20),
                right: getSize(20),
                top: getSize(14),
                bottom: getSize(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: getSize(35),
                        width: getSize(35),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(controller
                                    .listData[index].user?.profileImage
                                    .toString() ?? ""),
                            fit: BoxFit.cover
                          ),
                        ),
                      ),
                      // Image.network(
                      //   controller.listData[index].user?.profileImage
                      //           .toString() ??
                      //       "",
                      //   height: getSize(24),
                      //   fit: BoxFit.cover,
                      //   //width: getSize(50),
                      // ),
                      // Image.asset(
                      //   PngImageConstants.user,
                      //   height: getSize(24),
                      // ),
                      SizedBox(
                        width: getSize(20),
                      ),
                      BaseText(
                        text: controller.listData[index].user?.fullname
                                .toString() ??
                            "",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.MESSAGE);
                        },
                        child: SvgPicture.asset(
                          SvgImageConstants.message,
                          height: getSize(24),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getSize(30),
                  ),
                  Row(
                    children: [
                      BaseText(
                        text: "Date",
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        textColor: ColorConstants.white.withOpacity(0.6),
                      ),
                      SizedBox(
                        width: getSize(74),
                      ),
                      BaseText(
                        text: "Time",
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        textColor: ColorConstants.white.withOpacity(0.6),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getSize(4),
                  ),
                  Row(
                    children: [
                      BaseText(
                        text: DateFormat('dd/MM/yyyy').format(
                          DateTime.fromMillisecondsSinceEpoch(controller
                                  .listData[index].inspectionDate
                                  ?.toInt() ??
                              0),
                        ),
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                      SizedBox(
                        width: getSize(32),
                      ),
                      BaseText(
                        text: DateFormat('hh:mm').format(
                          DateTime.fromMillisecondsSinceEpoch(controller
                                  .listData[index].inspectionDate
                                  ?.toInt() ??
                              0),
                        ),
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getSize(10),
                  ),
                  BaseText(
                    text: "Place",
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    textColor: ColorConstants.white.withOpacity(0.6),
                  ),
                  SizedBox(
                    height: getSize(6),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        SvgImageConstants.location,
                      ),
                      SizedBox(
                        width: getSize(7),
                      ),
                      BaseText(
                        text: controller.listData[index].user?.address
                                .toString() ??
                            "",
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getSize(40),
                  ),
                  BaseElevatedButton(
                    borderRadius: BorderRadius.circular(8),
                    width: Get.width,
                    height: getSize(32),
                    onPressed: () {
                      Get.toNamed(Routes.EXAMINATION, arguments: controller.listData[index].jobId);
                      // Get.off(
                      //   ExaminationView(),
                      //   binding: ExaminationBindings(),
                      // );
                    },
                    child: BaseText(
                      text: "Start Examination",
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
