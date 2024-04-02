import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_craft/views/field_button.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "register_screen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
          child: Image.asset("images/assets/image_craft.png"),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              insideText: "Full Name",
              outsideText: "Full Name",
              pathName: "images/assets/user.png"),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "Phone number",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff6C563B)),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly
              ],
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
                  hintText: "Phone number",
                  hintStyle: const TextStyle(
                    color: Color(0xff6C563B),
                    fontSize: 16,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Image.asset("images/assets/smartphone.png"),
                  ),
                  contentPadding: const EdgeInsets.all(15)),
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
          FieldButton(
              insideText: "Enter your email",
              outsideText: "Email",
              pathName: "images/assets/mail.png"),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
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
                        icon:
                            Image.asset("images/assets/show_password_icon.png"),
                      ),
                contentPadding: const EdgeInsets.all(15)),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Register",
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
        ]),
      ),
    );
  }
}
