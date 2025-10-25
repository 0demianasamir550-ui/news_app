import 'package:flutter/material.dart';
import 'package:news_app/home/home_screen.dart';
import 'package:news_app/utils/app_routes.dart';
import 'package:news_app/utils/app_theme.dart';
import 'package:webview_flutter/webview_flutter.dart'; // ✅ فقط الاستيراد

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRouteName,
      routes: {
        AppRoutes.homeRouteName: (context) => HomeScreen(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}