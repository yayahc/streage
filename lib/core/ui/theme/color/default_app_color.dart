import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:streage/core/ui/theme/color/i_app_color.dart';

@Singleton(as: IAppColor)
class DefaultAppColor extends IAppColor {
  final Color _white = const Color(0xFFF9F9F9);
  final Color _black = const Color(0xF9000105);
  final Color _gray = const Color(0x7FE0E0E0);

  @override
  Color get background => _white;

  @override
  Color get black => _black;

  @override
  Color get gray => _gray;

  @override
  Color get white => _white;
}
