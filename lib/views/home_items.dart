// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_craft/cubits/fetch_cubits/fetch_images/images_cubit.dart';
import '../models/images_models/fetch_images/item.dart';
import 'car_view.dart';

class HomeItem extends StatelessWidget {
  final Item item;
  final int index;

  const HomeItem({
    required this.item,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ItemCubit>(context);
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
                item.imagePath,
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
                            item.imageName,
                            maxLines: 2,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${item.price} LE',
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
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            CarView.routeName,
                            arguments: item.id,
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
          GestureDetector(
            onTap: () async {
              await cubit.likeImage(item.id);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  border: Border.all(color: Colors.white)),
              child: Image.asset(
                "assets/love.png",
              ),
            ),
          )
        ],
      ),
    );
  }
}
