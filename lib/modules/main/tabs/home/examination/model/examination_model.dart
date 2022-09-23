import 'package:flutter/material.dart';
import 'package:home_yogi_flutter/shared/constants/constants.dart';
import 'package:home_yogi_flutter/shared/constants/svg_image_constant.dart';

class ExaminationModel {
  final String image;
  final String titleText;
  final String description;
  final List<Color>? gradientBorderColor;
  final List<Color>? gradientContainerColor;
  final double imageHeight;
  final double imageWidth;
  final bool isLocked;
  ExaminationModel({
    required this.image,
    required this.titleText,
    required this.description,
    this.isLocked = false,
    this.gradientBorderColor,
    this.gradientContainerColor,
    required this.imageHeight,
    required this.imageWidth,
  });
}

List<ExaminationModel> examinationModelList = [
  ExaminationModel(
    image: SvgImageConstants.summer,
    titleText: StringConstants.summer,
    description: 'don\'t want to be stuck in the heat? Learn to keep your home in good shape with our summer examinations.',
    imageHeight: 28,
    imageWidth: 39.02,
    isLocked: true,
    gradientContainerColor: [
      ColorConstants.summerGradient1,
      ColorConstants.summerGradient2,
    ],
  ),
  ExaminationModel(
    image: SvgImageConstants.fall,
    titleText: StringConstants.fall,
    description: 'don\'t want to be stuck in the heat? Learn to keep your home in good shape with our summer examinations.',
    imageHeight: 32.4,
    imageWidth: 32.43,
    gradientContainerColor: [
      ColorConstants.fallGradiant1,
      ColorConstants.fallGradiant2,
    ],
  ),
  ExaminationModel(
    image: SvgImageConstants.winter,
    titleText: StringConstants.winter,
    description: 'don\'t want to be stuck in the heat? Learn to keep your home in good shape with our summer examinations.',
    imageHeight: 38,
    imageWidth: 32.43,
    isLocked: true,
    gradientContainerColor: [
      ColorConstants.winterGradiant1,
      ColorConstants.winterGradiant2,
    ],
  ),
  ExaminationModel(
    image: SvgImageConstants.spring,
    titleText: StringConstants.spring,
    description: 'don\'t want to be stuck in the heat? Learn to keep your home in good shape with our summer examinations.',
    imageHeight: 45,
    imageWidth: 38,
    isLocked: true,
    gradientContainerColor: [
      ColorConstants.springGradiant1,
      ColorConstants.springlGradiant2,
    ],
  ),
];
