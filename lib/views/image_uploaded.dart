import 'package:flutter/material.dart';
import 'package:image_craft/views/upload_screen.dart';

class UploadImage extends StatelessWidget {
  static const String routeName = 'uploaded_successful';

  const UploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFFFFFF),
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
          height: 21.3,
          width: 140.6,
          alignment: Alignment.bottomCenter,
        ),
      ),
      body: Center(
        heightFactor: .9,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/Group.png',
                        height: 40,
                        width: 40,
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'SUCCESS',
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0XFF987854),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 3),
                      const Text(
                        'The Image Uploaded',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0XFF4A4A4A),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0XFF987854),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 54,
                        width: 285.93,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, UploadScreen.routeName);
                          },
                          child: const Text(
                            'Continue',
                            style: TextStyle(
                                fontSize: 18, color: Color(0XFFFFFFFF)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
