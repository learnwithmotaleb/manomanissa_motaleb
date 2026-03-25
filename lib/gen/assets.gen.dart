// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsDummyGen {
  const $AssetsDummyGen();

  /// File path: assets/dummy/Activity Male.gif
  AssetGenImage get activityMale =>
      const AssetGenImage('assets/dummy/Activity Male.gif');

  /// File path: assets/dummy/Activity jogging.gif
  AssetGenImage get activityJogging =>
      const AssetGenImage('assets/dummy/Activity jogging.gif');

  /// File path: assets/dummy/Drinking.gif
  AssetGenImage get drinking =>
      const AssetGenImage('assets/dummy/Drinking.gif');

  /// File path: assets/dummy/Frame 2147229116.png
  AssetGenImage get frame2147229116Png =>
      const AssetGenImage('assets/dummy/Frame 2147229116.png');

  /// File path: assets/dummy/Frame 2147229116.svg
  String get frame2147229116Svg => 'assets/dummy/Frame 2147229116.svg';

  /// File path: assets/dummy/Frame.png
  AssetGenImage get frame => const AssetGenImage('assets/dummy/Frame.png');

  /// File path: assets/dummy/Nutrition Female.gif
  AssetGenImage get nutritionFemale =>
      const AssetGenImage('assets/dummy/Nutrition Female.gif');

  /// File path: assets/dummy/Nutrition Male.gif
  AssetGenImage get nutritionMale =>
      const AssetGenImage('assets/dummy/Nutrition Male.gif');

  /// File path: assets/dummy/Sleeping.gif
  AssetGenImage get sleeping =>
      const AssetGenImage('assets/dummy/Sleeping.gif');

  /// File path: assets/dummy/aann.gif
  AssetGenImage get aann => const AssetGenImage('assets/dummy/aann.gif');

  /// File path: assets/dummy/bg.png
  AssetGenImage get bg => const AssetGenImage('assets/dummy/bg.png');

  /// File path: assets/dummy/blur.png
  AssetGenImage get blur => const AssetGenImage('assets/dummy/blur.png');

  /// File path: assets/dummy/button.PNG
  AssetGenImage get button => const AssetGenImage('assets/dummy/button.PNG');

  /// File path: assets/dummy/carecterf.gif
  AssetGenImage get carecterf =>
      const AssetGenImage('assets/dummy/carecterf.gif');

  /// File path: assets/dummy/dringking.gif
  AssetGenImage get dringking =>
      const AssetGenImage('assets/dummy/dringking.gif');

  /// File path: assets/dummy/female.png
  AssetGenImage get female => const AssetGenImage('assets/dummy/female.png');

  /// File path: assets/dummy/male.png
  AssetGenImage get male => const AssetGenImage('assets/dummy/male.png');

  /// File path: assets/dummy/sleeepingm.gif
  AssetGenImage get sleeepingm =>
      const AssetGenImage('assets/dummy/sleeepingm.gif');

  /// File path: assets/dummy/splashgif.gif
  AssetGenImage get splashgif =>
      const AssetGenImage('assets/dummy/splashgif.gif');

  /// File path: assets/dummy/verify.png
  AssetGenImage get verify => const AssetGenImage('assets/dummy/verify.png');

  /// File path: assets/dummy/welcom.png
  AssetGenImage get welcom => const AssetGenImage('assets/dummy/welcom.png');

  /// List of all assets
  List<dynamic> get values => [
    activityMale,
    activityJogging,
    drinking,
    frame2147229116Png,
    frame2147229116Svg,
    frame,
    nutritionFemale,
    nutritionMale,
    sleeping,
    aann,
    bg,
    blur,
    button,
    carecterf,
    dringking,
    female,
    male,
    sleeepingm,
    splashgif,
    verify,
    welcom,
  ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Chat_Check.png
  AssetGenImage get chatCheck =>
      const AssetGenImage('assets/icons/Chat_Check.png');

  /// File path: assets/icons/Frame.png
  AssetGenImage get frame => const AssetGenImage('assets/icons/Frame.png');

  /// File path: assets/icons/Group.png
  AssetGenImage get group => const AssetGenImage('assets/icons/Group.png');

  /// File path: assets/icons/ai 1.png
  AssetGenImage get ai1 => const AssetGenImage('assets/icons/ai 1.png');

  /// File path: assets/icons/en.png
  AssetGenImage get en => const AssetGenImage('assets/icons/en.png');

  /// File path: assets/icons/fr.png
  AssetGenImage get fr => const AssetGenImage('assets/icons/fr.png');

  /// File path: assets/icons/home-1 [Neaticons].png
  AssetGenImage get home1Neaticons =>
      const AssetGenImage('assets/icons/home-1 [Neaticons].png');

  /// File path: assets/icons/orange.png
  AssetGenImage get orange => const AssetGenImage('assets/icons/orange.png');

  /// File path: assets/icons/q.png
  AssetGenImage get q => const AssetGenImage('assets/icons/q.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    chatCheck,
    frame,
    group,
    ai1,
    en,
    fr,
    home1Neaticons,
    orange,
    q,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsDummyGen dummy = $AssetsDummyGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
