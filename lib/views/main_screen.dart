import 'package:flutter/material.dart';
import 'package:image_craft/views/home_screen.dart';
import 'package:image_craft/views/profile_view.dart';
import 'package:image_craft/views/shopping_cart.dart';
import 'package:image_craft/views/upload_screen.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = "main_screen";

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const UploadScreen(),

    const ProfileView()
  ];
  List<PreferredSizeWidget> appBars = [
    AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: const Color(0xffDCC7AD),
      title: Center(child: Image.asset("assets/image_craft.png")),
    ),
    AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      title: Center(child: Image.asset("assets/image_craft.png")),
    ),
    AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_sharp,
          size: 18,
        ),
        onPressed: () {},
      ),
      centerTitle: true,
      title: const Text(
        'Shopping cart',
        style: TextStyle(
          color: Color(0xff6C563B),
          fontSize: 21,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: const [
        Icon(
          Icons.add_shopping_cart,
          size: 30,
        )
      ],
    ),
    AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_sharp,
          size: 18,
        ),
        onPressed: () {},
      ),
      centerTitle: true,
      title: const Text(
        'user_name',
        style: TextStyle(
          color: Color(0xff6C563B),
          fontSize: 21,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBars[selectedIndex],
      body: SafeArea(child: screens[selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedItemColor: const Color(0xff6C563B),
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/home1.png"),
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
                icon: ImageIcon(AssetImage("assets/market.png"),
                    color: Color(0xff6C563B)),
                label: "",
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/user1.png"),
                  color: Color(0xff6C563B),
                ),
                label: "",
                backgroundColor: Colors.white),
          ]),
    );
  }
}
