import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'package:streage/core/ui/theme/typo/i_app_typography.dart';

@Singleton(as: IAppTypography)
class DefaultAppTypography extends IAppTypography {
  @override
  TextStyle get light => DefaultStyles.light;

  @override
  TextStyle get medium => DefaultStyles.medium;

  @override
  TextStyle get regular => DefaultStyles.regular;
}

class DefaultStyles {
  static TextStyle get light =>
      GoogleFonts.poppins(fontWeight: FontWeight.w300);

  static TextStyle get medium =>
      GoogleFonts.poppins(fontWeight: FontWeight.w500);

  static TextStyle get regular =>
      GoogleFonts.poppins(fontWeight: FontWeight.w400);
}
