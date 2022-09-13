import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/color_constants.dart';
import '../constants/svg_image_constant.dart';
import '../utils/math_utils.dart';
import 'base_text.dart';
import 'common_container_shadow.dart';
import 'common_linear_progress.dart';
import 'gradiant_container_with_image.dart';
import 'package:get/get.dart';

class CommonListTileWithImage extends StatelessWidget {
  final Widget image;
  final String titleText;
  final String? subText;
  final double? height;
  final double? width;
  final bool isLocked;
  final double percentage;
  final double? total;
  final List<Color>? gradientBorderColor;
  final List<Color>? gradientContainerColor;
  final Widget? rowWidget;
  final VoidCallback? onClickCallback;
  final Widget? progressBar;
  final String? isLockedText;

  const CommonListTileWithImage({
    Key? key,
    required this.image,
    required this.titleText,
    required this.percentage,
    this.gradientBorderColor,
    required this.gradientContainerColor,
    required this.onClickCallback,
    this.height,
    this.total,
    this.width,
    this.rowWidget,
    this.isLocked = false,
    this.subText,
    this.progressBar,
    this.isLockedText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(
        getSize(14),
      ),
      onTap: onClickCallback,
      child: CommonContainerWithShadow(
        child: Padding(
          padding: EdgeInsets.only(
            left: getSize(10),
            top: getSize(10),
            bottom: getSize(10),
            right: getSize(16),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Opacity(
                opacity: isLocked ? 0.1 : 1,
                child: Row(
                  children: [
                    GradiantContainerWithImage(
                      height: height ?? getSize(80),
                      width: width ?? getSize(80),
                      image: image,
                      gradientBorderColor: gradientBorderColor,
                      gradientContainerColor: gradientContainerColor ?? [],
                    ),
                    SizedBox(
                      width: getSize(20),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BaseText(
                            text: titleText,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                          SizedBox(
                            height: getSize(18),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: getSize(25)),
                            child: rowWidget,
                          ),
                          SizedBox(
                            height: getSize(7),
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonLinearProgressWidget(
                                width: Get.width * 0.48,
                                total: total ?? 1.0,
                                remaining: percentage,
                              ),
                             Spacer(),
                              SvgPicture.asset(
                                SvgImageConstants.arrowRight,
                              ),
                             // Spacer(),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              isLocked
                  ? Positioned.fill(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset(SvgImageConstants.lock),
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
        // child: Row(
        //   children: [
        //     GradiantContainerWithImage(
        //       height: height ?? getSize(80),
        //       width: width ?? getSize(80),
        //       image: image,
        //       gradientBorderColor: gradientBorderColor,
        //       gradientContainerColor: gradientContainerColor ?? [],
        //     ),
        //     SizedBox(
        //       width: getSize(20),
        //     ),
        //     Expanded(
        //       child: Column(
        //         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         // crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           BaseText(
        //             text: titleText,
        //             fontWeight: FontWeight.w500,
        //             fontSize: 20,
        //           ),
        //           Spacer(),
        //           Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Image.asset(
        //                 getAssetsPNGImg('chart_square'),
        //                 height: 15,
        //               ),
        //               SizedBox(
        //                 width: getSize(10.0),
        //               ),
        //               BaseText(
        //                 text: 'Progress',
        //                 fontSize: 10,
        //               ),
        //               Spacer(),
        //               BaseText(
        //                 text: '$percentage%',
        //                 fontSize: 10,
        //               ),
        //             ],
        //           ),
        //           SizedBox(
        //             height: 5.0,
        //           ),
        //           CommonLinearProgressWidget(
        //             width: 200,
        //             total: 100,
        //             remaining: percentage,
        //           ),
        //         ],
        //       ),
        //     ),
        //     SizedBox(
        //       width: getSize(10.0),
        //     ),
        //     SizedBox(
        //       height: getSize(80.0),
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.end,
        //         children: [
        //           InkWell(
        //             child: SvgPicture.asset(
        //               SvgImageConstants.arrowRight,
        //               // height: 18,
        //             ),
        //             onTap: onClickCallback,
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
      // child: Row(
      //   children: [
      //     GradiantContainerWithImage(
      //       height: height ?? getSize(80),
      //       width: width ?? getSize(80),
      //       image: image,
      //       gradientBorderColor: gradientBorderColor,
      //       gradientContainerColor: gradientContainerColor ?? [],
      //     ),
      //     SizedBox(
      //       width: getSize(20),
      //     ),
      //     Expanded(
      //       child: Column(
      //         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         // crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           BaseText(
      //             text: titleText,
      //             fontWeight: FontWeight.w500,
      //             fontSize: 20,
      //           ),
      //           Spacer(),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Image.asset(
      //                 getAssetsPNGImg('chart_square'),
      //                 height: 15,
      //               ),
      //               SizedBox(
      //                 width: getSize(10.0),
      //               ),
      //               BaseText(
      //                 text: 'Progress',
      //                 fontSize: 10,
      //               ),
      //               Spacer(),
      //               BaseText(
      //                 text: '$percentage%',
      //                 fontSize: 10,
      //               ),
      //             ],
      //           ),
      //           SizedBox(
      //             height: 5.0,
      //           ),
      //           CommonLinearProgressWidget(
      //             width: 200,
      //             total: 100,
      //             remaining: percentage,
      //           ),
      //         ],
      //       ),
      //     ),
      //     SizedBox(
      //       width: getSize(10.0),
      //     ),
      //     SizedBox(
      //       height: getSize(80.0),
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.end,
      //         children: [
      //           InkWell(
      //             child: SvgPicture.asset(
      //               SvgImageConstants.arrowRight,
      //               // height: 18,
      //             ),
      //             onTap: onClickCallback,
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

