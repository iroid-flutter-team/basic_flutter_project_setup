import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/api/api.dart';
import 'package:home_yogi_flutter/di.dart';
import 'package:home_yogi_flutter/modules/main/tabs/checklist/checklist_view.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/home_controller.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/home_view.dart';
import 'package:home_yogi_flutter/modules/main/tabs/notification/notification_view.dart';
import 'package:home_yogi_flutter/modules/main/tabs/setting/setting_view.dart';

class MainController extends GetxController {
  final ApiRepository apiRepository;

  MainController({required this.apiRepository});
  var currentTabIndex = 0.obs;
  var pageIndex = 0.obs;
  var pageList = <Widget>[].obs;
  DateTime currentBackPressTime = DateTime.now();
  Widget? homePage;
  Widget? checkListPage;
  Widget? notificationPage;
  Widget? settingPage;
  void switchTab(int index) async {
    currentTabIndex.value = index;
    switch (index) {
      case 0:
        if (!pageList.contains(homePage)) {
          pageList.add(homePage!);
        }
        pageIndex.value = pageList.indexOf(homePage);
        break;
      case 1:
        if (!pageList.contains(checkListPage)) {
          pageList.add(checkListPage!);
        }

        pageIndex.value = pageList.indexOf(checkListPage);
        break;
      case 2:
        Container();
        break;
      case 3:
        if (!pageList.contains(notificationPage)) {
          pageList.add(notificationPage!);
        }
        pageIndex.value = pageList.indexOf(notificationPage);
        break;
      case 4:
        if (!pageList.contains(settingPage)) {
          pageList.add(settingPage!);
        }
        pageIndex.value = pageList.indexOf(settingPage);
        break;

      default:
    }
  }

  @override
  void onInit() {
    DependencyInjection.getUserData();
    homePage = HomeView();
    checkListPage = CheckListView();
    notificationPage = NotificationScreen();
    settingPage = SettingView();
    pageList.add(homePage!);
    super.onInit();
  }
}
