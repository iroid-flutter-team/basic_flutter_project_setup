
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../shared/constants/color_constants.dart';
import '../../../../../shared/constants/png_image_constant.dart';
import '../../../../../shared/utils/math_utils.dart';
import '../../../../../shared/widgets/base_text.dart';
import '../../../../../shared/widgets/common_appbar.dart';
import '../../../../../shared/widgets/common_container_shadow.dart';

class ReviewView extends StatelessWidget {
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
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: getSize(25)),
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding:  EdgeInsets.only(top: getSize(20)),
            child: CommonContainerWithShadow(
              child: Padding(
                padding:  EdgeInsets.all(getSize(12)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: getSize(40),
                          width: getSize(40),
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorConstants.white, width: 1),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            PngImageConstants.user,
                          ),
                        ),
                        SizedBox(
                          width: getSize(12),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BaseText(
                              text: "Frank Garrett",
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                            _buildRatingBarView(),
                          ],
                        ),
                        Spacer(),
                        BaseText(
                          text: "1 Days ago",
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
                        text: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet."),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _buildRatingBarView() {
    return Row(
      children: [
        RatingBar.builder(
          itemSize: getSize(16),
          initialRating: 5,
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
          text: "5.0",
          fontSize: 14,
        ),
      ],
    );
  }
}
