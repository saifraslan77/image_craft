import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_craft/cubits/auth_cubits/register_cubit/register_cubit.dart';
import 'package:image_craft/views/field_button.dart';

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
          scrolledUnderElevation: 0,
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
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
                  const Center(
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff6C563B),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.06),
                  FieldButton(
                    controller: cubit.fullNameController,
                    insideText: "Full Name",
                    outsideText: "Full Name",
                    pathName: "assets/user1.png",
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      "Phone number",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff6C563B),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
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
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.transparent),
                        ),
                        hintText: "Phone number",
                        hintStyle: const TextStyle(
                          color: Color(0xff6C563B),
                          fontSize: 16,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Image.asset("assets/smartphone.png"),
                        ),
                        contentPadding: const EdgeInsets.all(15),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                  FieldButton(
                    controller: cubit.emailController,
                    insideText: "Enter your email",
                    outsideText: "Email",
                    pathName: "assets/mail.png",
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff6C563B),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: cubit.passwordController,
                    obscureText: isObscure,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffDCC7AD),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
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
                      contentPadding: const EdgeInsets.all(15),
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
                  if (state is! RegisterLoading)
                    ElevatedButton(
                      onPressed: state is RegisterLoading
                          ? null
                          : () {
                        cubit.register();
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                          MediaQuery.sizeOf(context).width * 0.9,
                          MediaQuery.sizeOf(context).height * 0.075,
                        ),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(10),
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
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.06),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(
                          color: Color(0xff6C563B),
                          fontSize: 15,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
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
