import 'package:flutter/material.dart';
import 'package:framework/core/ui/constants/app_colors.dart';
import 'package:framework/routes.dart';

import 'core/ui/constants/app_styles.dart';
import 'features/login/presentation/ui/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Framework App',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          color: AppColors.primary_800,
          iconTheme: IconThemeData(color: AppColors.white_900),
          textTheme: TextTheme(
            headline6: AppStyles.bold14(screenUtilActive: false),
          ),
        ),
        colorScheme: ColorScheme.light(
          onPrimary: AppColors.primary_800,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          color: AppColors.primary_800,
          iconTheme: IconThemeData(color: AppColors.white_900),
          textTheme: TextTheme(
            headline6: AppStyles.bold14(screenUtilActive: false),
          ),
        ),
        colorScheme: ColorScheme.light(
          onPrimary: AppColors.primary_800,
        ),
      ),
      home: LoginScreen(),
      initialRoute: '/',
      onGenerateRoute: getRoute,
    );
  }
}
