import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubits/auth_cubits/register_cubit/register_cubit.dart';
import '../cubits/auth_cubits/register_cubit/register_state.dart';
import '../views/field_button.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "register_screen";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Center(
            child: Image.asset("assets/image_craft.png"),
          ),
        ),
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            } else if (state is RegisterFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            final RegisterCubit cubit = BlocProvider.of<RegisterCubit>(context);
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  Center(
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 35.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff6C563B),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                  FieldButton(
                    controller: cubit.fullNameController,
                    insideText: "Full Name",
                    outsideText: "Full Name",
                    pathName: "assets/user1.png",
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Text(
                      "Phone number",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff6C563B),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 5.w),
                    child: TextFormField(
                      controller: cubit.phoneNumberController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
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
                        hintText: "Phone number",
                        hintStyle: TextStyle(
                          color: const Color(0xff6C563B),
                          fontSize: 16.sp,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Image.asset("assets/smartphone.png"),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  FieldButton(
                    controller: cubit.emailController,
                    insideText: "Enter your email",
                    outsideText: "Email",
                    pathName: "assets/mail.png",
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff6C563B),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.0125),
                  TextField(
                    controller: cubit.passwordController,
                    obscureText: isObscure,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffDCC7AD),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.r),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      hintText: "Enter Your Password",
                      hintStyle: const TextStyle(
                        color: Color(0xff6C563B),
                        fontSize: 16,
                      ),
                      suffixIcon: isObscure
                          ? IconButton(
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        icon: const Icon(Icons.visibility),
                      )
                          : IconButton(
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        icon: Image.asset("assets/show_password_icon.png"),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  if (state is! RegisterLoading)
                    ElevatedButton(
                      onPressed: state is RegisterLoading
                          ? null
                          : () {
                        cubit.register();
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.9,
                          MediaQuery.of(context).size.height * 0.075,
                        ),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          color: Color(0xff6C563B),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  if (state is RegisterLoading)
                    const Center(child: CircularProgressIndicator()),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          color: const Color(0xff6C563B),
                          fontSize: 15.sp,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15.sp,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
