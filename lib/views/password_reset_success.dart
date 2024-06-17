import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_craft/views/set_new_password_screen.dart';

class PasswordResetSuccessScreen extends StatelessWidget {
  static const String routeName = "reset_password_success_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            size: 18,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Image.asset(
          'assets/flutter-project.png',
          height: 21.3.h,
          width: 140.6.w,
          alignment: Alignment.bottomCenter,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password reset',
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xff987854),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Your password has been successfully reset. Click confirm to set a new password',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xff987854),
              ),
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, SetNewPasswordScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(389.w, 54.h),
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.red, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              child: Text(
                "Confirm",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff6C563B),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
