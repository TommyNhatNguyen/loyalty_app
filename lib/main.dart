import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:loyalty_app/configs/routes.dart';
import 'package:loyalty_app/themes/app_colors.dart';
import 'package:toastification/toastification.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      config: ToastificationConfig(
        animationDuration: Duration(milliseconds: 500),
      ),
      child: MaterialApp.router(
        routerConfig: router,
        theme: appTheme,
        builder: (context, child) => Scaffold(
          body: child,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
