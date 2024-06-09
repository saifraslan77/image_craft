import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/auth_cubits/reset_password_cubit/reset_password_cubit.dart';

class SetNewPasswordScreenNew extends StatefulWidget {
  static const String routeName = "set_new_password_screen_new";

  const SetNewPasswordScreenNew({super.key});

  @override
  _SetNewPasswordScreenNewState createState() => _SetNewPasswordScreenNewState();
}

class _SetNewPasswordScreenNewState extends State<SetNewPasswordScreenNew> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Center(
            child: Image.asset("assets/image_craft.png"),
          ),
        ),
        body: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {
            if (state is ResetPasswordSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Password reset successful')),
              );
              // Navigate to login screen or any other screen
            } else if (state is ResetPasswordFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<ResetPasswordCubit>();
            final screenWidth = MediaQuery.of(context).size.width;
            final screenHeight = MediaQuery.of(context).size.height;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Set a new password',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff987854),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  const Text(
                    'Please enter your new password below to reset your password.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff987854),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      "New Password",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff6C563B),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      controller: cubit.newPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffDCC7AD),
                        isDense: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        hintText: "Enter new password",
                        hintStyle: const TextStyle(
                          color: Color(0xff6C563B),
                          fontSize: 16,
                        ),
                        contentPadding: const EdgeInsets.all(18),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      "Confirm Password",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff6C563B),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      controller: cubit.confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffDCC7AD),
                        isDense: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        hintText: "Confirm new password",
                        hintStyle: const TextStyle(
                          color: Color(0xff6C563B),
                          fontSize: 16,
                        ),
                        contentPadding: const EdgeInsets.all(18),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  ElevatedButton(
                    onPressed: () async {
                      if (cubit.newPasswordController.text == cubit.confirmPasswordController.text) {
                        await cubit.resetPassword();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Passwords do not match')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        screenWidth * 0.9,
                        screenHeight * 0.075,
                      ),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Confirm",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff6C563B),
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
