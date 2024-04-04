import 'package:flutter/material.dart';
import 'package:image_craft/views/button_widget.dart';

class StartScreen extends StatelessWidget {
  static const String routeName = "start_screen";

  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: Center(child: Image.asset("assets/image_craft.png")),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.27),
            ButtonWidget(text: "Login",pathName: "login_screen"),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            ButtonWidget(text: "Register",pathName: "register_screen"),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            Row(
              children: [
                const SizedBox(width: 5),
                Expanded(child: Container(color: const Color(0xff6C563B), height: 1)),
                const Text(
                  "Or Log With",
                  style: TextStyle(
                      color: Color(0xff6C563B),
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Container(
                    color: const Color(0xff6C563B),
                    height: 1,
                  ),
                ),
                const SizedBox(width: 5)
              ],
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.sizeOf(context).width * 0.9,
                    MediaQuery.sizeOf(context).height * 0.065),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.blue,width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(image: AssetImage("assets/google_icon.png")),
                  SizedBox(width: 120),
                  Text(
                    "Google",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff6C563B),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.sizeOf(context).width * 0.9,
                    MediaQuery.sizeOf(context).height * 0.065),

                  backgroundColor: const Color(0xff2D9CDB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.facebook_outlined),
                  SizedBox(width: 120),
                  Text(
                    "Facebook",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
