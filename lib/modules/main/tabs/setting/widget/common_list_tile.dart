import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../shared/utils/math_utils.dart';
import '../../../../../shared/widgets/base_text.dart';

class CommonListTitle extends StatelessWidget {
  final String leadingIcon;
  final String title;
  final Widget? trailing;
  final void Function()? onTap;

  const CommonListTitle(
      {Key? key,
      required this.leadingIcon,
      required this.title,
      this.trailing,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 20,
      leading: SvgPicture.asset(
        getAssetsSVGImg(leadingIcon),
        height: getSize(25),
        width: getSize(25),
      ),
      title: BaseText(
        text: title,
        fontSize: 14,
        textColor: Colors.white.withOpacity(0.8),
      ),
      trailing: trailing ?? _buildForwardArrow(),
      onTap: onTap,
    );
  }

  _buildForwardArrow() {
    return SvgPicture.asset(
      getAssetsSVGImg('arrow_forward'),
      height: getSize(25),
      width: getSize(25),
    );
  }
}
