import 'package:flutter/material.dart';

extension ImagePathExtension on String {
  String get toSVG => 'assets/svg/$this.svg';

  AssetImage get pngImageAsset => AssetImage('assets/images/$this.png');
  AssetImage get pngLogoAsset => AssetImage('assets/logo/$this.png');
  AssetImage get pngIconAsset => AssetImage('assets/icon/$this.png');
}
