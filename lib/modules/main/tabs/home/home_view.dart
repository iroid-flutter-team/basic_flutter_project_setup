import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/di.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/examination/examination_view.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/home_controller.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/premium/widget/premium_services_widget.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/widgets/examination_list.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/widgets/home_appbar.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/widgets/progress_report_widget.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/widgets/to_do_list_widget.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/widgets/upgrade_widget.dart';
import 'package:home_yogi_flutter/routes/app_pages.dart';
import 'package:home_yogi_flutter/shared/constants/constants.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
            children: [
              SizedBox(
                height: getSize(50),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getSize(24)),
                child: HomeAppbarWidget(),
              ),
              SizedBox(
                height: getSize(20),
              ),
              Expanded(
                child: SmartRefresher(
                  physics: BouncingScrollPhysics(),
                  controller: controller.refreshController,
                  onRefresh: () {
                    controller.getProgressReport();
                    controller.refreshController.refreshCompleted();
                  },
                  child: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Obx(() {
                       // print("DependencyInjection123===========${DependencyInjection.userResponse.value.isPremium?.value}");
                        return Visibility(
                          visible: DependencyInjection.userResponse.value.isPremium?.value == true ? true : false,
                        //  visible: DependencyInjection.userResponse.value.isPremium?.value == true,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getSize(24)),
                            child: PremiumServicesWidget(
                              premiumServiceEnable: DependencyInjection
                                  .userResponse.value.isPremium?.value == true
                                  ? true
                                  : false,
                            ),
                          ),
                        );
                      },),
                      getTitleText('Examinations', showSeeAll: true,
                          onTapSeeAll: () {
                            Get.to(() => ExaminationView());
                          }),
                      SizedBox(
                        height: getSize(20),
                      ),
                      SizedBox(
                        height: getSize(85),
                        child: ExaminationListWidget(),
                      ),
                      SizedBox(
                        height: getSize(30),
                      ),
                      getTitleText("Progress report"),
                      SizedBox(
                        height: getSize(20),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: getSize(24)),
                        child: ProgressReportWidget(),
                      ),
                      SizedBox(
                        height: getSize(30),
                      ),
                      getTitleText(StringConstants.toDoList, showSeeAll: true,
                          onTapSeeAll: () {
                            printInfo(info: 'Open To Do List');
                            Get.toNamed(Routes.TO_DO_LIST);
                          }),
                      SizedBox(
                        height: getSize(20),
                      ),
                      SizedBox(height: getSize(90), child: ToDoListWidget()),
                      SizedBox(
                        height: getSize(30),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: getSize(24)),
                        child: UpgradeWidget(),
                      ),
                      Obx(() {
                        return Visibility(
                          visible: DependencyInjection.userResponse.value
                              .isPremium
                              ?.value == true ? false : true,
                          //visible: DependencyInjection.userResponse.value.isPremium!.value,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getSize(24), vertical: getSize(30)),
                            child: PremiumServicesWidget(
                              premiumServiceEnable: false,
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),

      ),
    );
  }

  getTitleText(String title,
      {bool showSeeAll = false, Function()? onTapSeeAll}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getSize(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BaseText(
            text: title,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
          if (showSeeAll)
            InkWell(
              onTap: onTapSeeAll,
              child: BaseText(
                text: StringConstants.seeAll,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textColor: ColorConstants.blueShadow,
              ),
            )
        ],
      ),
    );
  }
}
