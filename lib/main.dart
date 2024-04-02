import 'package:flutter/material.dart';
import 'package:image_craft/views/camera_widget.dart';
import 'package:image_craft/views/categories_list.dart';
import 'package:image_craft/views/home_screen.dart';
import 'package:image_craft/views/login_screen.dart';
import 'package:image_craft/views/register_screen.dart';
import 'package:image_craft/views/start_screen.dart';
import 'package:image_craft/views/upload_screen.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        StartScreen.routeName: (context) => const StartScreen(),
        CameraWidget.routeName: (context) => const CameraWidget(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        UploadScreen.routeName: (context) => const UploadScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: CategoriesList(text: '', pathName: '',),
    );
  }
}
