import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:grape_vender_app/shared/constants/color_constants.dart';
import 'package:grape_vender_app/shared/constants/string_constant.dart';
import 'package:grape_vender_app/shared/utils/math_utils.dart';
import 'package:grape_vender_app/shared/widgets/base_text.dart';

class NetworkListener {
  static final NetworkListener _instance = NetworkListener._internal();
  factory NetworkListener() => _instance;
  NetworkListener._internal();

  bool _isDialogShowing = false;
  BuildContext? _context;

  void initialize(BuildContext context) {
    _context = context;
    _listenToNetworkChanges();
  }

  void _listenToNetworkChanges() {
    Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      if (results.contains(ConnectivityResult.none)) {
        _showNoInternetDialog();
      } else {
        _dismissNoInternetDialog();
      }
    });
  }

  void _showNoInternetDialog() {
    if (!_isDialogShowing && _context != null) {
      _isDialogShowing = true;
      showDialog(
        context: _context!,
        barrierDismissible: false,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            backgroundColor: ColorConstants.white,
            insetPadding: EdgeInsets.symmetric(horizontal: getSize(20)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            title: _buildAnimatedIcon(
              dialogContext,
            ), // Pass dialogContext for vsync
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: getSize(20)),
                BaseText(
                  text: StringConstants.noInternetConnection,
                  fontSize: 22,
                  textColor: Colors.amber,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: getSize(20)),
                BaseText(
                  text: StringConstants.networkError.tr,
                  fontSize: 16,
                  textAlign: TextAlign.center,
                  textColor: ColorConstants.black.withValues(alpha: 0.5),
                ),
              ],
            ),
          );
        },
      ).then((_) {
        _isDialogShowing = false; // Reset flag when dialog is dismissed
      });
    }
  }

  // Extracted method for continuous animation
  Widget _buildAnimatedIcon(BuildContext dialogContext) {
    return Builder(
      builder: (BuildContext context) {
        // Create and manage the AnimationController here
        final AnimationController controller = AnimationController(
          duration: const Duration(seconds: 1),
          vsync: Navigator.of(dialogContext), // Use dialogContext for vsync
        )..repeat(reverse: true); // Start the animation and repeat indefinitely

        return AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Transform.scale(
              scale: 1.0 + (controller.value * 0.2), // Scale from 1.0 to 1.1
              child: Icon(
                Icons.wifi_off,
                color: Colors.amber,
                size: getSize(90),
              ),
            );
          },
        );
      },
    );
  }

  void _dismissNoInternetDialog() {
    if (_isDialogShowing && _context != null) {
      _isDialogShowing = false;
      Navigator.of(_context!, rootNavigator: true).pop();
    }
  }
}
