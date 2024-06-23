import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_craft/cubits/user_cubits/profile_images_cubit.dart';
import 'package:image_craft/views/home_screen.dart';
import 'package:image_craft/views/profile_view.dart';
import 'package:image_craft/views/shopping_cart.dart';
import 'package:image_craft/views/upload_screen.dart';

import '../cubits/fetch_cubits/fetch_images/images_cubit.dart';
import '../cubits/fetch_cubits/upload_image/upload_cubit.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = "main_screen";

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [
    BlocProvider(
      create: (context) => ItemCubit()..fetchItems(),
      child: const HomeScreen(),
    ),
    BlocProvider(
      create: (context) => UploadCubit(),
      child: const UploadScreen(),
    ),
    const ShoppingCart(),
    BlocProvider(
      create: (context) => ProfileCubit()
      ..loadUserProfile()
        ..fetchLikedImages()
        ..fetchOrderedImages()
        ..fetchUploadedImages(),
      child: const ProfileView(),
    )
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
        'User Profile',
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
      body: SafeArea(
        child: IndexedStack(
          index: selectedIndex,
          children: screens,
        ),
      ),
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
