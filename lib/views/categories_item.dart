import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_craft/views/items_of_categoris.dart';

import 'car_view.dart';

class CategoryItem extends StatelessWidget {
  String imageName;

  String imagePath;

  CategoryItem({super.key, required this.imageName, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      height: 230.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imagePath,
                fit: BoxFit.cover,
                height: 150.h,
                width: double.infinity,
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.w, right: 18.w, top: 16.h),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          imageName,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          '150.LE',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      height: 25.h,
                      width: 25.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black, width: 2)),
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Image.asset(
                            "assets/more.png",
                            height: 24,
                            width: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  border: Border.all(color: Colors.white)),
              child: Image.asset(
                "assets/love.png",
              ))
        ],
      ),
    );
  }
}
