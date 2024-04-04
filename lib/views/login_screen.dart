import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login_screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          title: Center(
            child: Image.asset("assets/image_craft.png"),
          ),
        ),
        body: SingleChildScrollView(
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
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffDCC7AD),
                      isDense: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.transparent)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.transparent)),
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
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffDCC7AD),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Colors.transparent)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.transparent)),
                    hintText: "Enter Your Password",
                    hintStyle: const TextStyle(
                      color: Color(0xff6C563B),
                      fontSize: 16,
                    ),
                    suffixIcon: isObscure
                        ? IconButton(
                            onPressed: () {
                              isObscure = !isObscure;
                              setState(() {});
                            },
                            icon: const Icon(Icons.visibility),
                          )
                        : IconButton(
                            onPressed: () {
                              isObscure = !isObscure;
                              setState(() {});
                            },
                            icon: Image.asset(
                                "assets/show_password_icon.png"),
                          ),
                    contentPadding: const EdgeInsets.all(18)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forget Password ?",
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
                onPressed: () {},
                child: const Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff6C563B)),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.sizeOf(context).width * 0.9,
                      MediaQuery.sizeOf(context).height * 0.075),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                     Navigator.of(context).pushNamed("register_screen");
                    },
                    child: const Text.rich(
                      TextSpan(
                          text: "Not have an account ?",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff6C563B),
                          ),
                          children: <InlineSpan>[
                            TextSpan(
                              text: "  Register",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff6C563B),
                              ),
                            )
                          ]),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}