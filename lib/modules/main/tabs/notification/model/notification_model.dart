import 'package:flutter/material.dart';

class NotificationModel {
  final String image;
  final List<Color> containerGradientColor;
  final String notificationMainTitle;
  final String notificationTime;
  final String notificationTitle;
  final String notificationSubTitle;
  final bool isNotificationSeen;

  NotificationModel({
    required this.image,
    required this.containerGradientColor,
    required this.notificationMainTitle,
    required this.notificationTime,
    required this.notificationTitle,
    required this.notificationSubTitle,
    this.isNotificationSeen = false,
  });
}
