// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_craft/views/categories_screen.dart';

// ignore: must_be_immutable
class CategoriesList extends StatelessWidget {
  String text;
  String pathName;

  CategoriesList({
    super.key,
    required this.text,
    required this.pathName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 65.h,
        width: 65.w,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                CategoryScreen.routeName,
                arguments: text,
              );
            },
            child: Image.asset(pathName, fit: BoxFit.none)),
      ),
      const SizedBox(height: 2),
      Text(
        text,
        style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Color(0xff6C563B)),
      ),
      const SizedBox(height: 10),
    ]);
  }
}
