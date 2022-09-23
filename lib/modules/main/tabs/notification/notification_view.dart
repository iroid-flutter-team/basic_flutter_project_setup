import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/examination/examination_view.dart';
import 'package:home_yogi_flutter/modules/main/tabs/notification/notification_controller.dart';
import 'package:home_yogi_flutter/shared/constants/svg_image_constant.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import 'package:home_yogi_flutter/shared/widgets/circle_progress_indicator.dart';
import 'package:home_yogi_flutter/shared/widgets/gradiant_container_with_image.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../di.dart';
import '../../../../models/response/home/notification_response.dart';
import '../../../../shared/constants/colors.dart';
import '../../../../shared/widgets/common_app_bar.dart';
import '../../../../shared/widgets/common_container_shadow.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({Key? key}) : super(key: key);

  final bool showText = false;

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        Scaffold(
          backgroundColor: ColorConstants.darkScaffoldBackgroundColor,
          appBar: BaseAppBar(
            title: 'Notification',
            leading: Padding(
              padding: EdgeInsets.only(left: 24),
              child: BaseCircleProgressIndicator(
                radius: 20,
                lineWidth: 3.5,
                percent: 0.75,
                // imagePath: controller.editProfileController.pickedImagePath.value,
                // imageUrl: DependencyInjection.userResponse.value.profileImage?.value,
              ),
            ),
          ),
          body: SmartRefresher(
            physics: BouncingScrollPhysics(),
            controller: controller.refreshController,
            onRefresh: () {
              controller.getNotification();
              controller.refreshController.refreshCompleted();
            },
            child: Obx(() {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: controller.notificationResponse.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: ((context, index) {
                  return Opacity(
                    opacity: controller.notificationResponse[index].readAt ==
                        null
                        ? 1
                        : 0.4,
                    child: Obx(() {
                      return CommonContainerWithShadow(
                        // padding: EdgeInsets.symmetric(
                        //   horizontal: getSize(14),
                        // ),
                        margin: EdgeInsets.symmetric(
                          horizontal: getSize(30),
                          vertical: getSize(12),
                        ),
                        child: InkWell(
                          onTap: () {
                            if (controller.notificationResponse[index].notificationId != null && controller.notificationResponse[index].readAt == null) {
                               controller.readNotification(controller.notificationResponse[index].notificationId!);
                            }

                            if(controller.notificationResponse[index].readAt == null){
                              controller.getNotification();
                            }
                            // if( controller.notificationResponse[index].readAt != null){
                            //   controller.getNotification();
                            // }
                            // controller.notificationResponse[index].readAt != null
                            //     ? null
                            //     : Get.to(
                            //   ExaminationView(),
                            // );
                          },
                          borderRadius: BorderRadius.circular(
                            getSize(14),
                          ),
                          child: Padding(
                              padding: EdgeInsets.only(
                                  right: getSize(14),
                                  left: getSize(14),
                                  top: getSize(8),
                                  bottom: getSize(12)),
                              child: notificationCard(
                                  index, controller.notificationResponse[index])
                            // Stack(
                            //   children: [
                            //     Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         SizedBox(
                            //           height: getSize(6),
                            //         ),
                            //         Row(
                            //           children: [
                            //             Stack(
                            //               alignment: Alignment.topRight,
                            //               clipBehavior: Clip.none,
                            //               children: [
                            //                 GradiantContainerWithImage(
                            //                     borderRadius: 6.0,
                            //                     height: getSize(24),
                            //                     width: getSize(24),
                            //                     image: SvgPicture.asset(
                            //                       SvgImageConstants.today,
                            //                       height: getSize(12),
                            //                       width: getSize(16),
                            //                     ),
                            //                     gradientContainerColor: [
                            //                       ColorConstants.todayGradient1,
                            //                       ColorConstants.todayGradient2
                            //                     ]),
                            //                 Visibility(
                            //                   visible: !controller
                            //                       .notificationResponse[index]
                            //                       .reatAt!,
                            //                   child: Positioned(
                            //                     top: getSize(-1.0),
                            //                     right: getSize(-1.0),
                            //                     child: Container(
                            //                       height: getSize(8),
                            //                       width: getSize(8),
                            //                       decoration: BoxDecoration(
                            //                         color: ColorConstants.red,
                            //                         shape: BoxShape.circle,
                            //                       ),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ],
                            //             ),
                            //             SizedBox(
                            //               width: getSize(10),
                            //             ),
                            //             BaseText(
                            //               text: controller
                            //                   .notificationModel[index]
                            //                   .notificationMainTitle,
                            //               fontSize: 12,
                            //             ),
                            //             Spacer(),
                            //             SvgPicture.asset(
                            //               SvgImageConstants.clock,
                            //               color: ColorConstants.white,
                            //               // height: getSize(10),
                            //               // width: getSize(10),
                            //             ),
                            //             SizedBox(
                            //               width: getSize(5),
                            //             ),
                            //             BaseText(
                            //               text: controller
                            //                   .notificationModel[index]
                            //                   .notificationTime,
                            //               fontSize: 12,
                            //             ),
                            //           ],
                            //         ),
                            //         SizedBox(
                            //           height: getSize(10),
                            //         ),
                            //         BaseText(
                            //           text: controller.notificationModel[index]
                            //               .notificationTitle,
                            //           fontSize: 14,
                            //           fontWeight: FontWeight.w500,
                            //         ),
                            //         SizedBox(
                            //           height: getSize(4),
                            //         ),
                            //         BaseText(
                            //           letterSpacing: 0.5,
                            //           lineHeight: 1.6,
                            //           text: controller.notificationModel[index]
                            //               .notificationSubTitle,
                            //           fontSize: 10,
                            //           textColor:
                            //               ColorConstants.white.withOpacity(0.7),
                            //         ),
                            //         SizedBox(
                            //           height: getSize(12),
                            //         ),
                            //       ],
                            //     ),
                            //     Positioned.fill(
                            //       //bottom: getSize(18),
                            //       child: Align(
                            //         alignment: Alignment.bottomRight,
                            //         child: SvgPicture.asset(
                            //           SvgImageConstants.arrowRight,
                            //           height: getSize(10),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ),
                        ),
                      );
                    }),
                  );
                }),
              );
            }),
          ),),
          // body: Padding(
          //   padding: EdgeInsets.symmetric(
          //     horizontal: getSize(30),
          //   ),
          //   // child: ListView(
          //   //   physics: BouncingScrollPhysics(),
          //   //   shrinkWrap: true,
          //   //   //crossAxisAlignment: CrossAxisAlignment.start,
          //   //   children: [
          //   //     BaseText(
          //   //       textAlign: TextAlign.start,
          //   //       text: "Recent",
          //   //       textColor: ColorConstants.white,
          //   //       fontSize: 14,
          //   //       fontWeight: FontWeight.w700,
         //
      //     ),
      //   //     SizedBox(
      //   //       height: getSize(20),
      //   //     ),
      //   //     Center(
      //   //       child: GestureDetector(
      //   //         onTap: () {
      //   //           Get.to(
      //   //             // UpgradePlanScreen(),
      //   //             // PlanAndBillingScreen(),
      //   //             // binding: PlanAndBillingBinding(),
      //   //             // LevelScreen(),
      //   //             ShowLevelRankScreen(),
      //   //           );
      //   //         },
      //   //         child: CommonContainerWithShadow(
      //   //           //height: getSize(110),
      //   //           child: Padding(
      //   //             padding: EdgeInsets.symmetric(
      //   //               horizontal: getSize(14),
      //   //               vertical: getSize(8),
      //   //             ),
      //   //             child: Column(
      //   //               crossAxisAlignment: CrossAxisAlignment.start,
      //   //               children: [
      //   //                 Row(
      //   //                   children: [
      //   //                     // Stack(
      //   //                     //   //clipBehavior: Clip.antiAlias,
      //   //                     //   alignment: Alignment.topRight,
      //   //                     //   children: [
      //   //                     //     CommonImageView(
      //   //                     //       image: SvgImageConstants.summer,
      //   //                     //     ),
      //   //                     //     Positioned(
      //   //                     //       top: 0.0,
      //   //                     //       right: -5.0,
      //   //                     //       child: Padding(
      //   //                     //         padding: EdgeInsets.only(left: 4.0),
      //   //                     //         child: Container(
      //   //                     //           height: 7,
      //   //                     //           width: 7,
      //   //                     //           decoration: BoxDecoration(
      //   //                     //             color: ColorConstants.red,
      //   //                     //             borderRadius:
      //   //                     //                 BorderRadius.circular(100),
      //   //                     //           ),
      //   //                     //         ),
      //   //                     //       ),
      //   //                     //     ),
      //   //                     //   ],
      //   //                     // ),
      //   //                     SizedBox(
      //   //                       height: 30,
      //   //                       width: 30,
      //   //                       child: Stack(
      //   //                         alignment: Alignment.center,
      //   //                         children: <Widget>[
      //   //                           CommonImageView(
      //   //                             image: SvgImageConstants.summer,
      //   //                           ),
      //   //                           Positioned(
      //   //                             top: 3.0,
      //   //                             right: 3,
      //   //                             child: Stack(
      //   //                               children: <Widget>[
      //   //                                 Container(
      //   //                                   height: 7,
      //   //                                   width: 7,
      //   //                                   decoration: BoxDecoration(
      //   //                                     color: ColorConstants.red,
      //   //                                     borderRadius:
      //   //                                         BorderRadius.circular(100),
      //   //                                   ),
      //   //                                 ),
      //   //                               ],
      //   //                             ),
      //   //                           )
      //   //                         ],
      //   //                       ),
      //   //                     ),
      //   //                     SizedBox(
      //   //                       width: getSize(6),
      //   //                     ),
      //   //                     BaseText(
      //   //                       text: "Examination",
      //   //                       fontSize: 10,
      //   //                     ),
      //   //                     Spacer(),
      //   //                     SvgPicture.asset(
      //   //                       SvgImageConstants.clock,
      //   //                       // height: 18,
      //   //                     ),
      //   //                     SizedBox(
      //   //                       width: getSize(4),
      //   //                     ),
      //   //                     BaseText(
      //   //                       text: "15 Min ago",
      //   //                       fontSize: 8,
      //   //                       textColor: ColorConstants.white.withOpacity(0.5),
      //   //                     ),
      //   //                   ],
      //   //                 ),
      //   //                 SizedBox(
      //   //                   height: getSize(6),
      //   //                 ),
      //   //                 BaseText(
      //   //                   text: "Summer Examination",
      //   //                   fontSize: 14,
      //   //                   fontWeight: FontWeight.w500,
      //   //                 ),
      //   //                 SizedBox(
      //   //                   height: getSize(4),
      //   //                 ),
      //   //                 Row(
      //   //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   //                   children: [
      //   //                     Expanded(
      //   //                       child: BaseText(
      //   //                         lineHeight: 1.6,
      //   //                         textAlign: TextAlign.start,
      //   //                         overflow: TextOverflow.visible,
      //   //                         text:
      //   //                             "You have until september 1st to completed summer exam. if you complete the exam by the deadline, you will receive coupons and discounts for home depot & more.",
      //   //                         fontSize: 10,
      //   //                         textColor:
      //   //                             ColorConstants.white.withOpacity(0.7),
      //   //                       ),
      //   //                     ),
      //   //                   ],
      //   //                 ),
      //   //                 Align(
      //   //                   alignment: Alignment.centerRight,
      //   //                   child: SvgPicture.asset(
      //   //                     SvgImageConstants.arrowRight,
      //   //                     // height: 18,
      //   //                   ),
      //   //                 ),
      //   //               ],
      //   //             ),
      //   //           ),
      //   //         ),
      //   //       ),
      //   //     ),
      //   //     SizedBox(
      //   //       height: getSize(20),
      //   //     ),
      //   //     CommonContainerWithShadow(
      //   //       // height: 74,
      //   //       child: Padding(
      //   //         padding: EdgeInsets.symmetric(
      //   //           horizontal: getSize(14),
      //   //           vertical: getSize(8),
      //   //         ),
      //   //         child: Column(
      //   //           crossAxisAlignment: CrossAxisAlignment.start,
      //   //           children: [
      //   //             Row(
      //   //               children: [
      //   //                 CommonImageView(
      //   //                   image: SvgImageConstants.summer,
      //   //                 ),
      //   //                 SizedBox(
      //   //                   width: getSize(6),
      //   //                 ),
      //   //                 BaseText(
      //   //                   text: "Examination",
      //   //                   fontSize: 10,
      //   //                 ),
      //   //                 Spacer(),
      //   //                 SvgPicture.asset(
      //   //                   SvgImageConstants.clock,
      //   //                   // height: 18,
      //   //                 ),
      //   //                 SizedBox(
      //   //                   width: getSize(4),
      //   //                 ),
      //   //                 BaseText(
      //   //                   text: "15 Min ago",
      //   //                   fontSize: 8,
      //   //                   textColor: ColorConstants.white.withOpacity(0.5),
      //   //                 ),
      //   //               ],
      //   //             ),
      //   //             SizedBox(
      //   //               height: getSize(6),
      //   //             ),
      //   //             BaseText(
      //   //               text: "Summer Examination",
      //   //               fontSize: 14,
      //   //               fontWeight: FontWeight.w500,
      //   //             ),
      //   //             SizedBox(
      //   //               height: getSize(4),
      //   //             ),
      //   //             Row(
      //   //               //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   //               children: [
      //   //                 Expanded(
      //   //                   child: BaseText(
      //   //                     textAlign: TextAlign.start,
      //   //                     overflow: TextOverflow.ellipsis,
      //   //                     maxLines: 1,
      //   //                     text:
      //   //                         "You have until september 1st to completed summer exam. if you complete the exam by the deadline, you will receive coupons and discounts for home depot & more.",
      //   //                     fontSize: 10,
      //   //                     textColor: ColorConstants.white.withOpacity(0.7),
      //   //                   ),
      //   //                 ),
      //   //                 // SizedBox(
      //   //                 //   width: 15,
      //   //                 // ),
      //   //                 SvgPicture.asset(
      //   //                   SvgImageConstants.arrowDown,
      //   //                   // height: 18,
      //   //                 ),
      //   //               ],
      //   //             ),
      //   //             // Align(
      //   //             //   alignment: Alignment.centerRight,
      //   //             //   child: SvgPicture.asset(
      //   //             //     SvgImageConstants.arrowRight,
      //   //             //     // height: 18,
      //   //             //   ),
      //   //             // ),
      //   //           ],
      //   //         ),
      //   //       ),
      //   //     ),
      //   //     SizedBox(
      //   //       height: getSize(30),
      //   //     ),
      //   //     BaseText(
      //   //       textAlign: TextAlign.start,
      //   //       text: "Today",
      //   //       textColor: ColorConstants.white,
      //   //       fontSize: 14,
      //   //       fontWeight: FontWeight.w700,
      //   //     ),
      //   //     SizedBox(
      //   //       height: getSize(16),
      //   //     ),
      //   //     Opacity(
      //   //       opacity: 0.2,
      //   //       child: ListView.builder(
      //   //         shrinkWrap: true,
      //   //         physics: NeverScrollableScrollPhysics(),
      //   //         itemCount: 5,
      //   //         itemBuilder: (context, index) {
      //   //           return Padding(
      //   //             padding: EdgeInsets.only(
      //   //               bottom: getSize(20),
      //   //             ),
      //   //             child: GestureDetector(
      //   //               onTap: () {
      //   //                 Get.to(ExaminationView());
      //   //               },
      //   //               child: CommonContainerWithShadow(
      //   //                 //height: getSize(110),
      //   //                 child: Padding(
      //   //                   padding: EdgeInsets.symmetric(
      //   //                     horizontal: getSize(14),
      //   //                     vertical: getSize(14),
      //   //                   ),
      //   //                   child: Column(
      //   //                     crossAxisAlignment: CrossAxisAlignment.start,
      //   //                     children: [
      //   //                       Row(
      //   //                         children: [
      //   //                           CommonImageView(
      //   //                             image: SvgImageConstants.summer,
      //   //                           ),
      //   //                           SizedBox(
      //   //                             width: getSize(6),
      //   //                           ),
      //   //                           BaseText(
      //   //                             text: "Examination",
      //   //                             fontSize: 10,
      //   //                           ),
      //   //                           Spacer(),
      //   //                           SvgPicture.asset(
      //   //                             SvgImageConstants.clock,
      //   //                             // height: 18,
      //   //                           ),
      //   //                           SizedBox(
      //   //                             width: getSize(4),
      //   //                           ),
      //   //                           BaseText(
      //   //                             text: "15 Min ago",
      //   //                             fontSize: 8,
      //   //                             textColor:
      //   //                                 ColorConstants.white.withOpacity(0.5),
      //   //                           ),
      //   //                         ],
      //   //                       ),
      //   //                       SizedBox(
      //   //                         height: getSize(6),
      //   //                       ),
      //   //                       BaseText(
      //   //                         text: "Summer Examination",
      //   //                         fontSize: 14,
      //   //                         fontWeight: FontWeight.w500,
      //   //                       ),
      //   //                       Row(
      //   //                         mainAxisAlignment:
      //   //                             MainAxisAlignment.spaceBetween,
      //   //                         children: [
      //   //                           Expanded(
      //   //                             child: BaseText(
      //   //                               lineHeight: 1.6,
      //   //                               textAlign: TextAlign.start,
      //   //                               overflow: TextOverflow.visible,
      //   //                               text:
      //   //                                   "You have until september 1st to completed summer exam. if you complete the exam by the deadline, you will receive coupons and discounts for home depot & more.",
      //   //                               fontSize: 10,
      //   //                               textColor:
      //   //                                   ColorConstants.white.withOpacity(0.7),
      //   //                             ),
      //   //                           ),
      //   //                         ],
      //   //                       ),
      //   //                       Align(
      //   //                         alignment: Alignment.centerRight,
      //   //                         child: SvgPicture.asset(
      //   //                           SvgImageConstants.arrowRight,
      //   //                           // height: 18,
      //   //                         ),
      //   //                       ),
      //   //                     ],
      //   //                   ),
      //   //                 ),
      //   //               ),
      //   //             ),
      //   //             // child: CommonContainerWithShadow(
      //   //             //   // height: 74,
      //   //             //   child: Padding(
      //   //             //     padding: EdgeInsets.symmetric(
      //   //             //       horizontal: getSize(14),
      //   //             //       vertical: getSize(8),
      //   //             //     ),
      //   //             //     child: Column(
      //   //             //       crossAxisAlignment: CrossAxisAlignment.start,
      //   //             //       children: [
      //   //             //         Row(
      //   //             //           children: [
      //   //             //             CommonImageView(
      //   //             //               image: SvgImageConstants.summer,
      //   //             //             ),
      //   //             //             SizedBox(
      //   //             //               width: getSize(6),
      //   //             //             ),
      //   //             //             BaseText(
      //   //             //               text: "Examination",
      //   //             //               fontSize: 10,
      //   //             //             ),
      //   //             //             Spacer(),
      //   //             //             SvgPicture.asset(
      //   //             //               SvgImageConstants.clock,
      //   //             //               // height: 18,
      //   //             //             ),
      //   //             //             SizedBox(
      //   //             //               width: getSize(4),
      //   //             //             ),
      //   //             //             BaseText(
      //   //             //               text: "15 Min ago",
      //   //             //               fontSize: 8,
      //   //             //               textColor: ColorConstants.white.withOpacity(0.5),
      //   //             //             ),
      //   //             //           ],
      //   //             //         ),
      //   //             //         SizedBox(
      //   //             //           height: getSize(6),
      //   //             //         ),
      //   //             //         BaseText(
      //   //             //           text: "Summer Examination",
      //   //             //           fontSize: 14,
      //   //             //           fontWeight: FontWeight.w500,
      //   //             //         ),
      //   //             //         SizedBox(
      //   //             //           height: getSize(4),
      //   //             //         ),
      //   //             //         Row(
      //   //             //           //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   //             //           children: [
      //   //             //             Expanded(
      //   //             //               child: BaseText(
      //   //             //                 textAlign: TextAlign.start,
      //   //             //                 overflow: TextOverflow.ellipsis,
      //   //             //                 maxLines: 1,
      //   //             //                 text:
      //   //             //                     "You have until september 1st to completed summer exam. if you complete the exam by the deadline, you will receive coupons and discounts for home depot & more.",
      //   //             //                 fontSize: 10,
      //   //             //                 textColor: ColorConstants.white.withOpacity(0.7),
      //   //             //               ),
      //   //             //             ),
      //   //             //             // SizedBox(
      //   //             //             //   width: 15,
      //   //             //             // ),
      //   //             //             SvgPicture.asset(
      //   //             //               SvgImageConstants.arrowDown,
      //   //             //               // height: 18,
      //   //             //             ),
      //   //             //           ],
      //   //             //         ),
      //   //             //         // Align(
      //   //             //         //   alignment: Alignment.centerRight,
      //   //             //         //   child: SvgPicture.asset(
      //   //             //         //     SvgImageConstants.arrowRight,
      //   //             //         //     // height: 18,
      //   //             //         //   ),
      //   //             //         // ),
      //   //             //       ],
      //   //             //     ),
      //   //             //   ),
      //   //             // ),
      //   //           );
      //   //         },
      //   //       ),
      //   //     )
      //   //   ],
      //   // ),
      // ),
    );
  }

  notificationCard(int index, NotificationResponse notification) {
    return Container(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getSize(6),
              ),
              Row(
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    clipBehavior: Clip.none,
                    children: [
                      GradiantContainerWithImage(
                          borderRadius: 6.0,
                          height: getSize(24),
                          width: getSize(24),
                          image: SvgPicture.asset(
                            SvgImageConstants.today,
                            height: getSize(12),
                            width: getSize(16),
                          ),
                          gradientContainerColor: [
                            ColorConstants.todayGradient1,
                            ColorConstants.todayGradient2
                          ]),
                      Visibility(
                        visible: controller.notificationResponse[index].readAt == null,
                        child: Positioned(
                          top: getSize(-1.0),
                          right: getSize(-1.0),
                          child: Container(
                            height: getSize(8),
                            width: getSize(8),
                            decoration: BoxDecoration(
                              color: ColorConstants.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: getSize(10),
                  ),
                  BaseText(
                    text: "Reminder",
                    fontSize: 12,
                  ),
                  Spacer(),
                  SvgPicture.asset(
                    SvgImageConstants.clock,
                    color: ColorConstants.white,
                    // height: getSize(10),
                    // width: getSize(10),
                  ),
                  SizedBox(
                    width: getSize(5),
                  ),
                  BaseText(
                    text: timeago.format(DateTime.fromMillisecondsSinceEpoch(
                        notification.createdAt!)),
                    // " ${DateFormat('dd-MMM-yyyy').format(
                    //     new DateTime.fromMillisecondsSinceEpoch(
                    //         notification.createdAt!))} ago",
                    fontSize: 12,
                  ),
                ],
              ),
              SizedBox(
                height: getSize(10),
              ),
              BaseText(
                text: "${notification.title}",
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: getSize(4),
              ),
              BaseText(
                letterSpacing: 0.5,
                lineHeight: 1.6,
                text: "${notification.message}",
                fontSize: 10,
                textColor: ColorConstants.white.withOpacity(0.7),
              ),
              SizedBox(
                height: getSize(12),
              ),
            ],
          ),
          Positioned.fill(
            //bottom: getSize(18),
            child: Align(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset(
                SvgImageConstants.arrowRight,
                height: getSize(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
