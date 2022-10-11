import 'package:align_flutter_app/modules/main/tabs/home/future_jobs/future_jobs_view.dart';
import 'package:align_flutter_app/modules/main/tabs/home/home_view_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../routes/app_pages.dart';
import '../../../../shared/constants/color_constants.dart';
import '../../../../shared/constants/svg_image_constant.dart';
import '../../../../shared/utils/math_utils.dart';
import '../../../../shared/widgets/base_text.dart';
import '../../../../shared/widgets/common_appbar.dart';
import '../../../../shared/widgets/common_container_shadow.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SmartRefresher(
        physics: BouncingScrollPhysics(),
        controller: controller.refreshController,
        onRefresh: () {
          controller.getJobs();
          controller.refreshController.refreshCompleted();
        },
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: getSize(60),
                  child: Padding(
                    padding: EdgeInsets.only(left: getSize(25), right: getSize(22), top: getSize(14)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // SizedBox(
                            //   height: getSize(6),
                            // ),
                            BaseText(
                              text: "Good morning",
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              textColor: ColorConstants.white.withOpacity(0.6),
                            ),
                            SizedBox(
                              height: getSize(4),
                            ),
                            BaseText(
                              text: "Albert Flores,",
                              fontSize: 18,
                              maxLines: 1,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.EXAMINATION_RESULT);
                          },
                          child: SvgPicture.asset(
                            SvgImageConstants.message1,
                            height: getSize(30),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _buildMainBody(),
                // SmartRefresher(
                //   physics: BouncingScrollPhysics(),
                //   controller: controller.refreshController,
                //   onRefresh: () {
                //     controller.getJobs();
                //     controller.refreshController.refreshCompleted();
                //   },
                //   child: ,
                // ),
              ],
            ),
          ],
          // appBar: BaseAppBar(
          //    title: '',
          //    leadingWidth: getSize(150),
          //    leading: Padding(
          //      padding: EdgeInsets.only(left: getSize(20), top: getSize(18)),
          //      child: Column(
          //        crossAxisAlignment: CrossAxisAlignment.start,
          //        children: [
          //          BaseText(
          //            text: "Good morning",
          //            fontSize: 12,
          //            fontWeight: FontWeight.w500,
          //            textColor: ColorConstants.white.withOpacity(0.6),
          //          ),
          //          SizedBox(
          //            height: getSize(4),
          //          ),
          //          Expanded(
          //            child: BaseText(
          //              text: "Albert Flores,",
          //              fontSize: 18,
          //              maxLines: 1,
          //              fontWeight: FontWeight.w600,
          //            ),
          //          ),
          //        ],
          //      ),
          //    ),
          //    actions: [
          //      Padding(
          //        padding: EdgeInsets.only(right: getSize(25), top: getSize(20)),
          //        child: InkWell(
          //          onTap: () {
          //            Get.toNamed(Routes.SUMMARY_REPORT);
          //          },
          //          child: SvgPicture.asset(
          //            SvgImageConstants.message1,
          //            height: getSize(30),
          //          ),
          //        ),
          //      ),
          //    ],
          //  ),
        ),
      ),

    );
  }

  _buildMainBody() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getSize(25),
      ),
      child: Obx(() {
        return Column(
          children: [
            SizedBox(
              height: getSize(25),
            ),
            CommonContainerWithShadow(
              width: Get.width,
              height: getSize(38),
              child: Center(
                child: BaseText(
                  text: "let’s help you finish your workday",
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(
              height: getSize(30),
            ),
            InkWell(
              onTap: () {
                controller.jobsResponse.value.todayJobs!.isNotEmpty
                    ? Get.toNamed(Routes.TODAY_JOBS,
                        arguments: controller.jobsResponse.value.todayJobs)
                    : Get.toNamed(Routes.FUTURE_JOBS);
              },
              child: CommonContainerWithShadow(
                height: getSize(74),
                child: Padding(
                  padding:
                      EdgeInsets.only(right: getSize(30), left: getSize(12)),
                  child: Row(
                    children: [
                      BaseText(
                        text: "Today jobs",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        width: getSize(10),
                      ),
                      BaseText(
                        text: controller.jobsResponse.value.todayJobs?.length
                                .toString() ??
                            "",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      Spacer(),
                      SvgPicture.asset(
                        SvgImageConstants.arrowRight1,
                        height: getSize(20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getSize(20),
            ),
            InkWell(
              onTap: () {
                // Get.toNamed(Routes.FUTURE_JOBS);
                controller.jobsResponse.value.futureJobs!.isNotEmpty
                    ? Get.toNamed(Routes.TODAY_JOBS,
                        arguments: controller.jobsResponse.value.futureJobs)
                    : Get.toNamed(Routes.FUTURE_JOBS);
                //controller.jobsResponse.value.futureJobs == null ? Get.toNamed(Routes.FUTURE_JOBS) :   Get.toNamed(Routes.TODAY_JOBS, arguments: controller.jobsResponse.value.futureJobs);
              },
              child: CommonContainerWithShadow(
                height: getSize(74),
                child: Padding(
                  padding:
                      EdgeInsets.only(right: getSize(30), left: getSize(12)),
                  child: Row(
                    children: [
                      BaseText(
                        text: "Future jobs",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        width: getSize(10),
                      ),
                      BaseText(
                        text: controller.jobsResponse.value.futureJobs?.length
                                .toString() ??
                            "",
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      Spacer(),
                      SvgPicture.asset(
                        SvgImageConstants.arrowRight1,
                        height: getSize(20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
