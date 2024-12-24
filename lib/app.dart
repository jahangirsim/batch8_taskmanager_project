import 'package:batch8_taskmanager_project/ui/screens/sign_in_screen.dart';
import 'package:batch8_taskmanager_project/ui/screens/sign_up_screen.dart';
import 'package:batch8_taskmanager_project/ui/screens/splash_screen.dart';
import 'package:batch8_taskmanager_project/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: AppColors.themeColor,
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
          titleMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
        ),
        inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none
              ),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide.none
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none
              ),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none
              )

        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.themeColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            fixedSize: const Size.fromWidth(double.maxFinite),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 12),
          )
        )
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings){
        late Widget widget;
        if(settings.name == SplashScreen.name){
          widget = const SplashScreen();
        }else if(settings.name == SignInScreen.name){
          widget = const SignInScreen();
        }else if(settings.name == SignupScreen.name){
          widget = const SignupScreen();
        }

        return MaterialPageRoute(builder: (_) => widget);
      },
    );
  }
}
