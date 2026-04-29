import 'package:ecommerce_app_api_26/core/cash/cash_helper.dart';
import 'package:ecommerce_app_api_26/features/auth/presentation/screens/login_screen.dart';
import 'package:ecommerce_app_api_26/features/main_wrapper/presentation/screens/main_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app_api_26/core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String? token = await CacheHelper.getToken();

  runApp(
    MyApp(
      startWidget: token != null ? const MainWrapper() : const LoginScreen(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({super.key, required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: startWidget,
    );
  }
}
