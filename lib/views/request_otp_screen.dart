import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_craft/views/verify_otp_screen.dart';
import '../cubits/auth_cubits/reset_password_cubit/reset_password_cubit.dart';

class RequestOTPScreen extends StatefulWidget {
  static const String routeName = "request_otp_screen";

  const RequestOTPScreen({super.key});

  @override
  _RequestOTPScreenState createState() => _RequestOTPScreenState();
}

class _RequestOTPScreenState extends State<RequestOTPScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              size: 18,
            ),
            onPressed: () {},
          ),
          centerTitle: true,
          title: Image.asset(
            'assets/flutter-project.png',
            height: 21.3,
            width: 140.6,
            alignment: Alignment.bottomCenter,
          ),
        ),
        body: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {
            if (state is ResetPasswordOTPSent) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('OTP sent successfully')),
              );
              // Navigate to verify OTP screen
              Navigator.pushNamed(context, VerifyOTPScreen.routeName);
            } else if (state is ResetPasswordFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<ResetPasswordCubit>();
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Forget Password',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff987854),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  const Text(
                    'Please enter your email to reset the password',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff987854),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: const Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff6C563B),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      controller: cubit.emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffDCC7AD),
                        isDense: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        hintText: "yourmail@mail.com",
                        hintStyle: const TextStyle(
                          color: Color(0xff6C563B),
                          fontSize: 16,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ElevatedButton(
                    onPressed: () async {
                      await cubit.requestOTP();
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        MediaQuery.of(context).size.width * 0.9,
                        MediaQuery.of(context).size.height * 0.075,
                      ),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.red, width: 2.w),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      "Reset password",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff6C563B),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
