import 'package:flutter/material.dart';
import 'package:sayer_app/common/theming/app_chip_theme.dart';

import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/theming/app_text_theme.dart';
import 'package:sayer_app/common/widgets/buttons/app_elevated_button.dart';
import 'package:sayer_app/common/widgets/custom_shape/app_text_field.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'sayerNewFont',
    disabledColor: AppColors.grey,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    textTheme: AppTextTheme.lightTextTheme,
    chipTheme: AppChipTheme.lightChipTheme,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.white, elevation: 0),
    elevatedButtonTheme: AppElevatedButton.lightElevatedButtonTheme,
    inputDecorationTheme: AppTextField.lightInputDecorationTheme,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.info,
      selectionColor: AppColors.info.withOpacity(0.5),
      selectionHandleColor: AppColors.info.withOpacity(0.5),
    ),

    splashColor: Colors.grey,
    highlightColor: Colors.grey,
    hoverColor: Colors.grey.withOpacity(0.1),

    buttonTheme: ButtonThemeData(splashColor: Colors.grey),
  );
}
