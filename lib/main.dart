import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_craft/views/camera_widget.dart';
import 'package:image_craft/views/car_view.dart';
import 'package:image_craft/views/password_reset_success.dart';
import 'package:image_craft/views/set_new_password_screen.dart';
import 'package:image_craft/views/home_screen.dart';
import 'package:image_craft/views/login_screen.dart';
import 'package:image_craft/views/main_screen.dart';
import 'package:image_craft/views/register_screen.dart';
import 'package:image_craft/views/request_otp_screen.dart';
import 'package:image_craft/views/shopping_cart.dart';
import 'package:image_craft/views/start_screen.dart';
import 'package:image_craft/views/verify_otp_screen.dart';

void main() {
  runApp(const ImageCraft());
}

class ImageCraft extends StatelessWidget {
  const ImageCraft({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const ShoppingCart(),
          routes: {
            StartScreen.routeName: (_) => const StartScreen(),
            CameraWidget.routeName: (_) => const CameraWidget(),
            LoginScreen.routeName: (_) => const LoginScreen(),
            RegisterScreen.routeName: (_) => const RegisterScreen(),
            HomeScreen.routeName: (_) => const HomeScreen(),
            MainScreen.routeName: (_) => const MainScreen(),
            RequestOTPScreen.routeName: (_) => const RequestOTPScreen(),
            VerifyOTPScreen.routeName: (_) => const VerifyOTPScreen(),
            PasswordResetSuccessScreen.routeName: (_) => PasswordResetSuccessScreen(),
            SetNewPasswordScreen.routeName: (_) => const SetNewPasswordScreen(),
          },
        );
      },
    );
  }
}
