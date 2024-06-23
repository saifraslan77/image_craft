import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_craft/cubits/auth_cubits/login_cubit/login_cubit.dart';
import 'package:image_craft/views/main_screen.dart';
import 'package:image_craft/views/request_otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = "login_screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
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
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Login Successful')),
              );
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            final LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.09),
                  const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff6C563B)),
                    ),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      "Email",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff6C563B)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      controller: cubit.emailController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xffDCC7AD),
                          isDense: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.transparent)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  const BorderSide(color: Colors.transparent)),
                          hintText: "Enter Your Email",
                          hintStyle: const TextStyle(
                            color: Color(0xff6C563B),
                            fontSize: 16,
                          ),
                          contentPadding: const EdgeInsets.all(18)),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      "Password",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff6C563B)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    obscureText: isObscure,
                    controller: cubit.passwordController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffDCC7AD),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        hintText: "Enter Your Password",
                        hintStyle: const TextStyle(
                          color: Color(0xff6C563B),
                          fontSize: 16,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          icon: Icon(
                            isObscure ? Icons.visibility : Icons.visibility_off,
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(18)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RequestOTPScreen.routeName);
                        },
                        child: const Text(
                          "Forget Password?",
                          style: TextStyle(
                              color: Color(0xff6C563B),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () async {
                      await cubit.login();
                      Navigator.pushNamed(context, MainScreen.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                        MediaQuery.sizeOf(context).width * 0.9,
                        MediaQuery.sizeOf(context).height * 0.075,
                      ),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff6C563B)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed("register_screen");
                        },
                        child: const Text.rich(
                          TextSpan(
                            text: "Not have an account?",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff6C563B),
                            ),
                            children: <InlineSpan>[
                              TextSpan(
                                text: " Register",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff6C563B),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
