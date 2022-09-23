import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../shared/constants/colors.dart';
import '../../shared/constants/png_image_constant.dart';
import '../../shared/constants/svg_image_constant.dart';
import '../../shared/utils/math_utils.dart';
import '../bottom_bar/model/nav_bar_item.dart';
import '../bottom_bar/sliding_clipped_nav_bar.dart';
import 'main_controller.dart';

class MainTab extends GetView<MainController> {
  const MainTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          return false;
          // final isFirstRouteInCurrentTab = !(await controller
          //     .navigatorKeys[controller.curentPage]!.currentState!
          //     .maybePop());

          // print(isFirstRouteInCurrentTab);
          // if (isFirstRouteInCurrentTab) {
          //   DateTime now = DateTime.now();
          //   if (now.difference(controller.currentBackPressTime) >
          //       Duration(seconds: 2)) {
          //     controller.currentBackPressTime = now;
          //     ScaffoldMessenger.of(context).showSnackBar(
          //       const SnackBar(
          //         content: Text("Back"),
          //       ),
          //     );

          //     return Future.value(false);
          //   }
          //   return Future.value(true);
          // }

          // return isFirstRouteInCurrentTab;
        },
        child: _buildWidget(),
      ),
    );
  }

  Widget _buildWidget() {
    return Scaffold(
      // extendBody: true,
      body: IndexedStack(
        index: controller.pageIndex.value,
        children: controller.pageList,
      ),
      // bottomNavigationBar: CustomBottomNavigation(
      //   onTap: (index) => index == 2 ? null : controller.switchTab(index),
      //   currentIndex: controller.currentTabIndex.value,
      // ),
      bottomNavigationBar: _buildSlidingClippedNavBar(),
    );
  }

  _buildSlidingClippedNavBar() {
    return SlidingClippedNavBar(
      backgroundColor: Colors.transparent,
      onButtonPressed: (index) =>
          index == 2 ? null : controller.switchTab(index),
      iconSize: getSize(24),
      activeColor: Colors.white,
      selectedIndex: controller.currentTabIndex.value,
      barItems: [
        _buildBarItem(
            normalIcon: SvgImageConstants.home,
            selectedIcon: PngImageConstants.homeSelected,
            title: 'Home'),
        _buildBarItem(
            normalIcon: SvgImageConstants.task,
            selectedIcon: PngImageConstants.taskSelected,
            title: 'Task'),
        buildCenterBulbWidget(),
        _buildBarItem(
            normalIcon: SvgImageConstants.notification,
            selectedIcon: PngImageConstants.notificationSelected,
            title: 'Notification'),
        _buildBarItem(
            normalIcon: SvgImageConstants.setting,
            selectedIcon: PngImageConstants.settingSelected,
            title: 'Settings'),
      ],
    );
  }

  _buildBarItem(
      {required String normalIcon,
      required String selectedIcon,
      required String title}) {
    return NavBarItem(
      normalIcon: SvgPicture.asset(
        normalIcon,
        height: getSize(24),
        width: getSize(24),
      ),
      selectedIcon: Image.asset(
        selectedIcon,
        height: getSize(28),
        width: getSize(28),
      ),
      title: title,
    );
  }

  buildCenterBulbWidget() {
    return Container(
      height: getSize(44),
      width: getSize(44),
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(255, 255, 255, 0.1),
            Color.fromRGBO(255, 255, 255, 0.01),
          ],
          begin: Alignment(-1.0, -2.0),
          end: Alignment(1.0, 2.0),
        ),
        shadows: [
          BoxShadow(
            color: ColorConstants.black,
            spreadRadius: 0,
            offset: const Offset(5, 6),
            blurRadius: 20,
          ),
        ],
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius.all(SmoothRadius(
            cornerRadius: getSize(14),
            cornerSmoothing: 1,
          )),
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(getSize(1.0)),
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(99, 185, 255, 1),
              Color.fromRGBO(16, 89, 146, 1),
            ],
            begin: Alignment(-1.0, -4.0),
            end: Alignment(1.0, 4.0),
          ),
          shape: SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius.all(SmoothRadius(
              cornerRadius: getSize(14),
              cornerSmoothing: 1,
            )),
          ),
        ),
        child: SvgPicture.asset(SvgImageConstants.bulb),
      ),
    );
  }

// Widget buildOffstageNavigator(String tabItem, MainController _) {
//   return Offstage(
//     offstage: _.curentPage.value != tabItem,
//     child: TabNavigator(
//       navigatorKey: _.navigatorKeys[tabItem]!,
//       tabItem: tabItem,
//     ),
//   );
// }
}
