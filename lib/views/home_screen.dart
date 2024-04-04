import 'package:flutter/material.dart';
import 'package:image_craft/views/camera_widget.dart';
import 'package:image_craft/views/categories_list.dart';
import 'package:image_craft/views/home_items.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffDCC7AD),
        appBar: AppBar(
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          title: Center(child: Image.asset("assets/image_craft.png")),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Image.asset("assets/search.png"),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        hintText: "Search for image",
                        hintStyle: const TextStyle(
                          color: Color(0xff6C563B),
                          fontSize: 16,
                        ),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, CameraWidget.routeName);
                    },
                    icon: Image.asset("assets/Icon1.png"),
                    iconSize: 12,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Text(
                "Categories",
                style: TextStyle(
                  color: Color(0xff6C563B),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: CategoriesList(
                      text: "Animals",
                      pathName: "assets/animals.png",
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: CategoriesList(
                      text: "Birds",
                      pathName: "assets/bird.png",
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: CategoriesList(
                      text: "Persons",
                      pathName: "assets/persons.png",
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: CategoriesList(
                      text: "Vehicles",
                      pathName: "assets/transportation.png",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeItem(
                    pathName: "assets/baby1.png",
                    text: "Baby Boy \nL.E 180",
                  ),
                  HomeItem(
                    pathName: "assets/dog.png",
                    text: "Pretty Dog \nL.E 100",
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeItem(
                    pathName: "assets/car1.png",
                    text: "Blue Car \nL.E 120",
                  ),
                  HomeItem(
                    pathName: "assets/chair.png",
                    text: "Baby Boy \nL.E 110",
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color(0xff6C563B),
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/home1.png"),
                color: Color(0xff6C563B),
              ),
              activeIcon: ImageIcon(
                AssetImage("assets/home1.png"),
                color: Color(0xff6C563B),
              ),
              label: "",
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/nav2.png"),
                color: Color(0xff6C563B),
              ),
              activeIcon: ImageIcon(
                AssetImage("assets/nav2.png"),
                color: Color(0xff6C563B),
              ),
              label: "",
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/market.png"),
                color: Color(0xff6C563B),
              ),
              activeIcon: ImageIcon(
                AssetImage("assets/market.png"),
                color: Color(0xff6C563B),
              ),
              label: "",
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/user1.png"),
                color: Color(0xff6C563B),
              ),
              activeIcon: ImageIcon(
                AssetImage("assets/user1.png"),
                color: Color(0xff6C563B),
              ),
              label: "",
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
