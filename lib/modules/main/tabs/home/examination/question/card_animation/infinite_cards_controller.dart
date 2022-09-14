import 'package:flutter/widgets.dart';

import 'anim_helper.dart';
import 'anim_transform.dart';
import 'infinite_card_view.dart';

class InfiniteCardsController {
  //widget item builder
  IndexedWidgetBuilder _itemBuilder;

  //item count
  int _itemCount;

  //switch anim duration
  //Duration _animDuration;

  //true: switch animation while click on item, false: item not clickable
  bool _clickItemToSwitch;

  //anim transforms
  AnimTransform
      _transformToBack,
      _transformCommon;
      //_transformAdd;

  //zIndex transforms
  ZIndexTransform _zIndexTransformCommon, _zIndexTransformToBack;

  //animation type
  AnimType _animType;

  //curve
  Curve _curve;

  //helper
  late AnimHelper _animHelper;

  InfiniteCardsController({
    required IndexedWidgetBuilder itemBuilder,
    required int itemCount,
    Duration? animDuration,
    bool clickItemToSwitch = true,
    AnimTransform transformToBack = DefaultToBackTransform,
    AnimTransform transformCommon = DefaultCommonTransform,
   // AnimTransform transformAdd = DefaultAddTransform,
    ZIndexTransform zIndexTransformCommon = DefaultCommonZIndexTransform,
    ZIndexTransform zIndexTransformToBack = DefaultCommonZIndexTransform,
    AnimType animType = AnimType.TO_FRONT,
    Curve curve = DefaultCurve,
  })  : _itemBuilder = itemBuilder,
        _itemCount = itemCount,
        //_animDuration = animDuration!,
        _clickItemToSwitch = clickItemToSwitch,
        _transformToBack = transformToBack,
        _transformCommon = transformCommon,
       // _transformAdd = transformAdd,
        _zIndexTransformCommon = zIndexTransformCommon,
        _zIndexTransformToBack = zIndexTransformToBack,
        _animType = animType,
        _curve = curve;

  void previous() {
    _animHelper.previous();
  }

  void next() {
    _animHelper.next();
  }

  void anim(int index) {
    _animHelper.anim(index);
  }

  //reset params
  void reset({
    IndexedWidgetBuilder? itemBuilder,
    int? itemCount,
    Duration? animDuration,
    bool? clickItemToSwitch,
    AnimTransform? transformToFront,
    AnimTransform? transformToBack,
    AnimTransform? transformCommon,
    AnimTransform? transformAdd,
    ZIndexTransform? zIndexTransformCommon,
    ZIndexTransform? zIndexTransformToFront,
    ZIndexTransform? zIndexTransformToBack,
    AnimType? animType,
    Curve? curve,
    bool forceReset = false,
  }) {
    if (_animHelper.isAnim()) {
      return;
    }
    //if item is changed, force reset
    if (itemBuilder != null || itemCount != null) {
      forceReset = true;
    }
    //reset params while remove anim comes to an end
    _animHelper.animCallback = (AnimStatus status) {
      if (status == AnimStatus.RemoveEnd) {
        _itemBuilder = itemBuilder ?? _itemBuilder;
        _itemCount = itemCount ?? _itemCount;
      //  _animDuration = animDuration ?? _animDuration;
        _clickItemToSwitch = clickItemToSwitch ?? _clickItemToSwitch;
        _transformToBack = transformToBack ?? _transformToBack;
        _transformCommon = transformCommon ?? _transformCommon;
        //_transformAdd = transformAdd ?? _transformAdd;
        _zIndexTransformCommon =
            zIndexTransformCommon ?? _zIndexTransformCommon;
        _zIndexTransformToBack =
            zIndexTransformToBack ?? _zIndexTransformToBack;
        _animType = animType ?? _animType;
        _curve = curve ?? _curve;
        if (forceReset) {
          _animHelper.resetWidgets();
        }
        //_animHelper.animCallback = null;
      }
    };
    if (forceReset) {
      _animHelper.reset();
      return;
    }
    //direct set params
    _animHelper.animCallback!(AnimStatus.RemoveEnd);
  }

  Curve get curve => _curve;

  AnimType get animType => _animType;

  get zIndexTransformToBack => _zIndexTransformToBack;

  ZIndexTransform get zIndexTransformCommon => _zIndexTransformCommon;

  //get transformAdd => _transformAdd;

  get transformCommon => _transformCommon;

  get transformToBack => _transformToBack;

  bool get clickItemToSwitch => _clickItemToSwitch;

  //Duration get animDuration => _animDuration;

  int get itemCount => _itemCount;

  IndexedWidgetBuilder get itemBuilder => _itemBuilder;

  set animHelper(AnimHelper value) {
    _animHelper = value;
  }
}
