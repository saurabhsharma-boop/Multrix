import 'package:flutter/material.dart';

import '../core/constants/app_strings.dart';
import '../core/theme/app_theme.dart';
import 'app_router.dart';

class BaithakApp extends StatelessWidget {
  const BaithakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: AppTheme.darkPremium(),
      routerConfig: appRouter,
    );
  }
}
