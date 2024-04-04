import 'package:flutter/material.dart';
import 'package:image_craft/views/upload_field.dart';
class UploadScreen extends StatefulWidget {
  static const String routeName = "upload_screen";

  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(child: Image.asset("assets/image_craft.png")),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(children: [
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
          const Center(
            child: Text(
              "Upload",
              style: TextStyle(
                color: Color(0xff6C563B),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.04),
          Stack(
            children: [
              Image.asset(
                "assets/item.png",
              ),
              Image.asset("assets/dog1.png",
                  height: MediaQuery.sizeOf(context).height * 0.15),
            ],
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
          UploadField(textOut: "Category", textIn: "Write correct category"),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
          UploadField(textOut: "Image Name", textIn: "Subtitle name"),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
          UploadField(textOut: "Price", textIn: "LE 100"),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
          UploadField(textOut: "Description", textIn: "your description"),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.025),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Upload",
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
          BottomNavigationBar(
              selectedItemColor: const Color(0xff6C563B),
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: const [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/home.png"),
                        color: Color(0xff6C563B)),
                    label: "",
                    backgroundColor: Colors.white),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                        AssetImage(
                          "assets/nav2.png",
                        ),
                        color: Color(0xff6C563B)),
                    label: "",
                    backgroundColor: Colors.white),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                        AssetImage("assets/market.png"),
                        color: Color(0xff6C563B)),
                    label: "",
                    backgroundColor: Colors.white),
                BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage("assets/user.png"),
                      color: Color(0xff6C563B),
                    ),
                    label: "",
                    backgroundColor: Colors.white),
              ]

          )
        ]),
      ),
    )

    );

  }
}
