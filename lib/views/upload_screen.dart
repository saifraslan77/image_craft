import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_craft/views/upload_field.dart';

class UploadScreen extends StatelessWidget {

  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return SingleChildScrollView(
        padding: EdgeInsets.only(
          right: 12.w,
          left: 12.w,
          top: 46.h,
          bottom: 12.h
        ),
        child: Column(children: [
          Text(
            "Upload",
            style: TextStyle(
              color: Color(0xff6C563B),
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight * 0.04),
          Stack(
            children: [
              Image.asset(
                "assets/item.png",
              ),
              Image.asset(width: 128.w, height: 100.h, "assets/dog1.png"),
            ],
          ),
          SizedBox(height: screenHeight * 0.01),
          UploadField(textOut: "Category", textIn: "Write correct category"),
          SizedBox(height: screenHeight * 0.01),
          UploadField(textOut: "Image Name", textIn: "Subtitle name"),
          SizedBox(height: screenHeight * 0.01),
          UploadField(textOut: "Price", textIn: "LE 100"),
          SizedBox(height: screenHeight * 0.01),
          UploadField(textOut: "Description", textIn: "your description"),
          SizedBox(height: screenHeight * 0.01),
          UploadField(textOut: "Location", textIn: "your location"),
          SizedBox(height: screenHeight * 0.025),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Upload",
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff6C563B)),
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: Size(390.w, 54.h),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.red, width: 2.w),
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
        ]),
      );
  }

}
//
// appBar: AppBar(
// elevation: 0,
// scrolledUnderElevation: 0,
// backgroundColor: Colors.transparent,
// title: Center(child: Image.asset("assets/image_craft.png")),
// ),
