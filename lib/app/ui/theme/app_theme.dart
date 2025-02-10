import 'package:go_app/app/ui/theme/app_colors.dart';
import 'package:go_app/app/ui/theme/app_fonts.dart';

class AppTheme {
  late final AppColors _appColors;
  late AppFonts _appFonts;

  AppTheme() : _appColors = AppColors.standard() {
    _appFonts = AppFonts.fromAppColors(_appColors);
  }

  AppColors get appColors => _appColors;
  AppFonts get appFonts => _appFonts;
}
