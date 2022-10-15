import 'package:align_flutter_app/models/response/home/review/review_response.dart';
import 'package:align_flutter_app/modules/main/tabs/history/review/review_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../../../shared/constants/color_constants.dart';
import '../../../../../shared/constants/png_image_constant.dart';
import '../../../../../shared/utils/math_utils.dart';
import '../../../../../shared/widgets/base_text.dart';
import '../../../../../shared/widgets/common_appbar.dart';
import '../../../../../shared/widgets/common_container_shadow.dart';

class ReviewView extends GetView<ReviewController> {
  const ReviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Review',
      ),
      body: _buildMainBody(),
    );
  }

  _buildMainBody() {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: getSize(25)),
        child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: controller.reviewResponse.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: getSize(20)),
              child: CommonContainerWithShadow(
                child: Padding(
                  padding: EdgeInsets.all(getSize(12)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: getSize(40),
                            width: getSize(40),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorConstants.white, width: 1),
                              image: DecorationImage(
                                  image: controller.reviewResponse[index].userProfileImage != null
                                      ? NetworkImage(
                                          controller.reviewResponse[index]
                                              .userProfileImage
                                              .toString()
                                        ) as ImageProvider
                                      : AssetImage(
                                          PngImageConstants.user,
                                        ),fit: BoxFit.cover),
                              shape: BoxShape.circle,
                            ),
                            // child: controller.reviewResponse[index]
                            //             .userProfileImage !=
                            //         null
                            //     ? Image.network(
                            //         controller
                            //             .reviewResponse[index].userProfileImage
                            //             .toString(),
                            //         fit: BoxFit.fill,
                            //       )
                            //     : Image.asset(
                            //         PngImageConstants.user,
                            //       ),
                          ),
                          SizedBox(
                            width: getSize(12),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BaseText(
                                text: controller
                                    .reviewResponse[index].userFullName
                                    .toString(),
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                              _buildRatingBarView(
                                  controller.reviewResponse[index]),
                            ],
                          ),
                          Spacer(),
                          BaseText(
                            text: timeago.format(
                                DateTime.fromMillisecondsSinceEpoch(controller
                                        .reviewResponse[index].createdAt ??
                                    0)),
                            fontSize: 12,
                            textColor: ColorConstants.white.withOpacity(0.8),
                          )
                        ],
                      ),
                      SizedBox(
                        height: getSize(10),
                      ),
                      BaseText(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          text: controller.reviewResponse[index].description
                              .toString()),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }

  _buildRatingBarView(ReviewResponse reviewResponse) {
    return Row(
      children: [
        RatingBar.builder(
          itemSize: getSize(16),
          initialRating: reviewResponse.rating?.toDouble() ?? 0,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          glow: false,
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        SizedBox(
          width: getSize(8),
        ),
        BaseText(
          text: reviewResponse.rating.toString(),
          fontSize: 14,
        ),
      ],
    );
  }
}
