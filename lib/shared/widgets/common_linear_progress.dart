import 'package:flutter/material.dart';
import 'package:home_yogi_flutter/shared/constants/colors.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CommonLinearProgressWidget extends StatelessWidget {
  final double width;
  final double? total;
  final double remaining;
  final double? lineHeight;
  const CommonLinearProgressWidget(
      {Key? key,
      required this.width,
      required this.total,
      required this.remaining,
      this.lineHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("division========${(remaining / total)}");
    // print("remaining========${remaining}");
    //print("total========+++$total");
    return LinearPercentIndicator(
      width: width,
      lineHeight: lineHeight ?? getSize(6),
      padding: EdgeInsets.zero,
      animationDuration: 2000,
      //   percent: 0.2,
      percent: (remaining == 0 || total == 0) ? 0 : (remaining / total!),
      barRadius: Radius.circular(20),
      progressColor: ColorConstants.progressColor,
      backgroundColor: ColorConstants.progressBackGroundColor,
    );
  }
}
