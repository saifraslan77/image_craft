import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_craft/views/camera_widget.dart';
import 'package:image_craft/views/categories_list.dart';
import 'package:image_craft/views/home_items.dart';
import 'items.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  var itemList = Item.getCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      color: const Color(0xffDCC7AD),
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
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 24.w,
                  mainAxisSpacing: 15.h,
                  childAspectRatio: 0.85),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {},
                    child: HomeItem(
                      item: itemList[index],
                      index: index,
                    ));
              },
              itemCount: itemList.length,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
// appBar: AppBar(
// elevation: 0,
// scrolledUnderElevation: 0,
// backgroundColor: Colors.transparent,
// title: Center(child: Image.asset("assets/image_craft.png")),
// ),
