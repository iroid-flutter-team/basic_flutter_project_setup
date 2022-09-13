import 'package:align_flutter_app/shared/widgets/base_text.dart';
import 'package:flutter/material.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BaseText(text: "History",),
      ),
    );
  }
}
