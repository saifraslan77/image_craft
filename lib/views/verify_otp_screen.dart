import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_craft/views/password_reset_success.dart';
import '../cubits/auth_cubits/verify_otp_cubit/verify_otp_cubit.dart';
import '../cubits/auth_cubits/verify_otp_cubit/verify_otp_state.dart';

class VerifyOTPScreen extends StatefulWidget {
  static const String routeName = "verify_otp_screen";

  const VerifyOTPScreen({super.key});

  @override
  _VerifyOTPScreenState createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  late List<TextEditingController> otpControllers;

  @override
  void initState() {
    super.initState();
    otpControllers = List.generate(6, (_) => TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyOTPScreenCubit(),
      child: Scaffold(
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
        body: BlocConsumer<VerifyOTPScreenCubit, VerifyOTPScreenState>(
          listener: (context, state) {
            if (state is VerifyOTPScreenSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('OTP verified successfully')),
              );
              Navigator.pushNamed(context, PasswordResetSuccessScreen.routeName);
            } else if (state is VerifyOTPScreenFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<VerifyOTPScreenCubit>();

            return SingleChildScrollView(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff987854),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'We sent a reset link to alpha...@gmail.com\nEnter the 6-digit code mentioned in the email',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff987854),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) {
                      return SizedBox(
                        width: 50.w,
                        height: 50.h,
                        child: TextField(
                          controller: otpControllers[index],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          decoration: InputDecoration(
                            counterText: '',
                            fillColor: Colors.transparent,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.r),
                                topRight: Radius.circular(0.r),
                                bottomLeft: Radius.circular(0.r),
                                bottomRight: Radius.circular(0.r),
                              ),
                              borderSide: const BorderSide(
                                color: Color(0xff987854),
                                width: 1.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.r)),
                              borderSide: const BorderSide(
                                color: Color(0xff987854),
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.r),
                                topRight: Radius.circular(0.r),
                                bottomLeft: Radius.circular(0.r),
                                bottomRight: Radius.circular(0.r),
                              ),
                              borderSide: const BorderSide(
                                color: Color(0xff987854),
                                width: 1.0,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty && index < 5) {
                              FocusScope.of(context).nextFocus();
                            } else if (value.isEmpty && index > 0) {
                              FocusScope.of(context).previousFocus();
                            }
                          },
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 20.h),
                  ElevatedButton(
                    onPressed: () async {
                      String otp = otpControllers.map((controller) => controller.text).join();
                      cubit.verifyOTP('alpha...@gmail.com', otp); // Replace with actual email
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(389.w, 54.h),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      "Verify Code",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff6C563B),
                      ),
                    ),
                  ),
                  if (state is VerifyOTPScreenLoading)
                    const Center(child: CircularProgressIndicator()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
