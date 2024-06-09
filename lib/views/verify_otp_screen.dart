import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        body: BlocConsumer<VerifyOTPScreenCubit, VerifyOTPScreenState>(
          listener: (context, state) {
            if (state is VerifyOTPScreenSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('OTP verified successfully')),
              );
              // Navigate to reset password screen or show success message
            } else if (state is VerifyOTPScreenFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<VerifyOTPScreenCubit>();
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff987854),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  const Text(
                    'We sent a reset link to alpha...@gmail.com\nEnter the 6-digit code mentioned in the email',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff987854),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(6, (index) {
                      return SizedBox(
                        width: 50,
                        height: 50,
                        child: TextField(
                          controller: otpControllers[index],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          decoration: const InputDecoration(
                            counterText: '',
                            fillColor: Colors.transparent,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                              ),
                              borderSide: BorderSide(
                                color: Color(0xff987854),
                                width: 1.0,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                color: Color(0xff987854),
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                              ),
                              borderSide: BorderSide(
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ElevatedButton(
                    onPressed: () async {
                      String otp = otpControllers.map((controller) => controller.text).join();
                      cubit.verifyOTP('alpha...@gmail.com', otp); // Replace with actual email
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(389, 54),
                      backgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: const Text(
                      "Verify Code",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff6C563B),
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
