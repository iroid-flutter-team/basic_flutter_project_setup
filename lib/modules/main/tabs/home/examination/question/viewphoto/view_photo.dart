import 'package:flutter/material.dart';
import '../../../../../../../shared/widgets/common_app_bar.dart';

class ViewPhotoScreen extends StatelessWidget {
  const ViewPhotoScreen({
    Key? key,
    required this.networkImagePath,
  }) : super(key: key);

  final String networkImagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'View Photo',
      ),
      body: _buildMainBody(),
    );
  }

  _buildMainBody() {
    return Container(
      child: _buildImageView(),
    );
  }

  _buildImageView() {
    return Image.network(
      networkImagePath,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }
}
