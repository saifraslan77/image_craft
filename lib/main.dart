import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_craft/views/camera_widget.dart';
import 'package:image_craft/views/car_view.dart';
import 'package:image_craft/views/categories_screen.dart';
import 'package:image_craft/views/home_screen.dart';
import 'package:image_craft/views/image_search.dart';
import 'package:image_craft/views/image_uploaded.dart';
import 'package:image_craft/views/login_screen.dart';
import 'package:image_craft/views/main_screen.dart';
import 'package:image_craft/views/password_reset_success.dart';
import 'package:image_craft/views/register_screen.dart';
import 'package:image_craft/views/request_otp_screen.dart';
import 'package:image_craft/views/set_new_password_screen.dart';
import 'package:image_craft/views/start_screen.dart';
import 'package:image_craft/views/upload_screen.dart';
import 'package:image_craft/views/verify_otp_screen.dart';
import 'cubits/fetch_cubits/search_image/image_search_cubit.dart';

void main() {
  runApp(const ImageCraft());
}

class ImageCraft extends StatelessWidget {
  const ImageCraft({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          routes: {
            StartScreen.routeName: (context) => const StartScreen(),
            CameraWidget.routeName: (context) => const CameraWidget(),
            LoginScreen.routeName: (context) => const LoginScreen(),
            RegisterScreen.routeName: (context) => const RegisterScreen(),
            HomeScreen.routeName: (context) => const HomeScreen(),
            MainScreen.routeName: (context) => const MainScreen(),
            RequestOTPScreen.routeName: (context) => const RequestOTPScreen(),
            VerifyOTPScreen.routeName: (_) => const VerifyOTPScreen(),
            PasswordResetSuccessScreen.routeName: (_) =>
                PasswordResetSuccessScreen(),
            SetNewPasswordScreen.routeName: (_) => const SetNewPasswordScreen(),
            CarView.routeName: (context) => const CarView(),
            CategoryScreen.routeName: (context) => const CategoryScreen(),
            UploadImage.routeName: (context) => const UploadImage(),
            UploadScreen.routeName: (context) => const UploadScreen(),
            SearchScreen.routeName: (context) => BlocProvider(
                  create: (context) => SearchCubit(),
                  child: const SearchScreen(),
                ),
          },
          debugShowCheckedModeBanner: false,
          home: const StartScreen(),
          // BlocProvider(
          //   create: (context) => ProfileCubit(),
          //   child: ProfileView(),
          // ),
        );
      },
    );
  }
}
