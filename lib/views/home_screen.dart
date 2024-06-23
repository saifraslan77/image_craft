import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubits/fetch_cubits/fetch_images/images_cubit.dart';
import '../cubits/fetch_cubits/fetch_images/images_states.dart';
import 'camera_widget.dart';
import 'categories_list.dart';
import 'home_items.dart';
import 'image_search.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "home_screen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDCC7AD),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            _buildSearchBar(context),
            const SizedBox(height: 15),
            _buildCategoriesSection(),
            const SizedBox(height: 15),
            _buildItemsGrid(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            readOnly: true,
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
            onTap: () {
              Navigator.pushNamed(context, SearchScreen.routeName);
            },
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
    );
  }

  Widget _buildCategoriesSection() {
    final categories = [
      {"text": "street", "pathName": "assets/animals.png"},
      {"text": "forest", "pathName": "assets/animals.png"},
      {"text": "glacier", "pathName": "assets/animals.png"},
      {"text": "mountain", "pathName": "assets/animals.png"},
      {"text": "sea", "pathName": "assets/animals.png"},
      {"text": "building", "pathName": "assets/bird.png"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Categories",
          style: TextStyle(
            color: Color(0xff6C563B),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 100, // Adjust height to fit the content
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CategoriesList(
                  text: category["text"]!,
                  pathName: category["pathName"]!,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildItemsGrid() {
    return Expanded(
      child: BlocConsumer<ItemCubit, ItemState>(
        listener: (context, state) {
          if (state is LikeItemLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Image Liked Successfully'))
            );
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<ItemCubit>(context);
          if (state is ItemLoading && cubit.items.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ItemError && cubit.items.isEmpty) {
            return Center(child: Text(state.message));
          } else if (state is ItemLoaded && cubit.items.isEmpty) {
            return const Center(child: Text('No items available'));
          } else {
            return GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 0.8,
              ),
              itemCount: cubit.items.length,
              itemBuilder: (context, index) {
                final item = cubit.items[index];
                return InkWell(
                  onTap: () {
                    // Navigator.pushNamed(
                    //   context,
                    //   CarView.routeName,
                    //   arguments: item.id, // Assuming `item.id` is the ID to pass
                  },
                  child: HomeItem(
                    item: item,
                    index: index,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
