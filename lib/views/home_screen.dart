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
          title: Center(child: Image.asset("images/assets/image_craft.png")),
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
                        prefixIcon: Image.asset("images/assets/search.png"),
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
                    icon: Image.asset("images/assets/Icon.png"),
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
                      pathName: "images/assets/animals.png",
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: CategoriesList(
                      text: "Birds",
                      pathName: "images/assets/bird.png",
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: CategoriesList(
                      text: "Persons",
                      pathName: "images/assets/persons.png",
                    ),
                  ),
                  const SizedBox(width: 30),
                  Expanded(
                    child: CategoriesList(
                      text: "Vehicles",
                      pathName: "images/assets/transportation.png",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeItem(
                    pathName: "images/assets/baby.png",
                    text: "Baby Boy \nL.E 180",
                  ),
                  HomeItem(
                    pathName: "images/assets/dog.png",
                    text: "Pretty Dog \nL.E 100",
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeItem(
                    pathName: "images/assets/car.png",
                    text: "Blue Car \nL.E 120",
                  ),
                  HomeItem(
                    pathName: "images/assets/chair.png",
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
                AssetImage("images/assets/home.png"),
                color: Color(0xff6C563B),
              ),
              activeIcon: ImageIcon(
                AssetImage("images/assets/home_active.png"),
                color: Color(0xff6C563B),
              ),
              label: "",
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("images/assets/nav2.png"),
                color: Color(0xff6C563B),
              ),
              activeIcon: ImageIcon(
                AssetImage("images/assets/nav2_active.png"),
                color: Color(0xff6C563B),
              ),
              label: "",
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("images/assets/market.png"),
                color: Color(0xff6C563B),
              ),
              activeIcon: ImageIcon(
                AssetImage("images/assets/market_active.png"),
                color: Color(0xff6C563B),
              ),
              label: "",
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("images/assets/user.png"),
                color: Color(0xff6C563B),
              ),
              activeIcon: ImageIcon(
                AssetImage("images/assets/user_active.png"),
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
