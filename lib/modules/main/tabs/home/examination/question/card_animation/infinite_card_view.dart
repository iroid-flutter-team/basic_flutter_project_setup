import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'anim_helper.dart';
import 'infinite_cards_controller.dart';

//Three types of animation
enum AnimType {
  TO_FRONT, //custom animation for chosen card, common animation for other cards
  SWITCH, //witch the position by custom animation of the first card and the chosen card
  TO_END, //moving the first card to last position by custom animation, common animation for others
}

class InfiniteCards extends StatefulWidget {
  final double? width, height;
  final InfiniteCardsController controller;

  const InfiniteCards({
    Key? key,
    this.width,
    this.height,
    required this.controller,
  }) : super(key: key);

  @override
  InfiniteCardsState createState() => InfiniteCardsState();

}

class InfiniteCardsState extends State<InfiniteCards>
    with TickerProviderStateMixin {
  late double _width, _height;
  late AnimHelper _helper;

  @override
  void initState() {
    super.initState();
    //init background, helper, controller

    _helper = AnimHelper(
      controller: widget.controller,
      listenerForSetState: _listenerForSetState,
    );
    _helper.init(this, context);
    widget.controller.animHelper = _helper;
  }


  void _listenerForSetState() {
      setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _width = widget.width ?? MediaQuery.of(context).size.width;
    _height = widget.height ?? MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.all(0.0),
      width: _width,
      height: _height,
      child: Stack(
        children: _helper.getCardList(_width, _height),
      ),
    );
  }
}
