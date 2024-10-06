/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $LibGen {
  const $LibGen();

  /// Directory path: lib/i18n
  $LibI18nGen get i18n => const $LibI18nGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/green_smiley.png
  AssetGenImage get greenSmiley =>
      const AssetGenImage('assets/images/green_smiley.png');

  /// File path: assets/images/hospital_gutierrez.png
  AssetGenImage get hospitalGutierrez =>
      const AssetGenImage('assets/images/hospital_gutierrez.png');

  /// File path: assets/images/red_smiley.png
  AssetGenImage get redSmiley =>
      const AssetGenImage('assets/images/red_smiley.png');

  /// File path: assets/images/socaba_redondo.png
  AssetGenImage get socabaRedondo =>
      const AssetGenImage('assets/images/socaba_redondo.png');

  /// File path: assets/images/yellow_smiley.png
  AssetGenImage get yellowSmiley =>
      const AssetGenImage('assets/images/yellow_smiley.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [greenSmiley, hospitalGutierrez, redSmiley, socabaRedondo, yellowSmiley];
}

class $LibI18nGen {
  const $LibI18nGen();

  /// File path: lib/i18n/en_US.json
  String get enUS => 'lib/i18n/en_US.json';

  /// File path: lib/i18n/es_ES.json
  String get esES => 'lib/i18n/es_ES.json';

  /// List of all assets
  List<String> get values => [enUS, esES];
}

class Assets {
  Assets._();

  static const String bloodPressure = 'assets/blood_pressure.db';
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const String model = 'assets/model.tflite';
  static const AssetGenImage smokeEffectAdults =
      AssetGenImage('assets/smoke_effect_adults.png');
  static const $LibGen lib = $LibGen();

  /// List of all assets
  static List<dynamic> get values => [bloodPressure, model, smokeEffectAdults];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
