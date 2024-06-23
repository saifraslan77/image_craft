import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/images_models/fetch_category_images/FetchCategoryImages.dart';
import 'car_view.dart';

class CategoryItem extends StatelessWidget {
  final CategoryImage datum;

  const CategoryItem({super.key, required this.datum});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                datum.imagePath ?? '',
                fit: BoxFit.cover,
                height: 150.h,
                width: double.infinity,
              ),
              Padding(
                padding: EdgeInsets.only(left: 12.w, right: 18.w, top: 16.h),
                child: Row(
                  children: [
                    SizedBox(
                      width: 120.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            datum.imageName ?? '',
                            maxLines: 3,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${datum.price} L.E",
                            maxLines: 2,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 25.h,
                      width: 25.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black, width: 2)),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            CarView.routeName,
                            arguments: datum.id ?? 0,
                          );
                        },
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
