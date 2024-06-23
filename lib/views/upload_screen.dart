import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubits/fetch_cubits/upload_image/upload_cubit.dart';
import '../cubits/fetch_cubits/upload_image/upload_states.dart';
import 'image_uploaded.dart';
import 'upload_field.dart';

class UploadScreen extends StatelessWidget {
  static const String routeName = 'upload_screen';

  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.sizeOf(context).height;
    return BlocConsumer<UploadCubit, UploadState>(
      listener: (context, state) {
        if (state is UploadSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.response.message)),
          );
        } else if (state is UploadFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        final cubit = BlocProvider.of<UploadCubit>(context);
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            right: 12.w,
            left: 12.w,
            top: 46.h,
            bottom: 12.h,
          ),
          child: Column(
            children: [
              Text(
                "Upload",
                style: TextStyle(
                  color: const Color(0xff6C563B),
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              GestureDetector(
                onTap: () async {
                  await cubit.pickImage();
                },
                child: cubit.image == null
                    ? Image.asset(
                        "assets/dog1.png",
                        width: 128.w,
                        height: 100.h,
                      )
                    : Image.file(
                        File(cubit.image!.path),
                        width: 128.w,
                        height: 100.h,
                      ),
              ),
              SizedBox(height: screenHeight * 0.01),
              UploadField(
                textOut: "Category",
                textIn: "Write correct category",
                controller: cubit.categoryController,
              ),
              SizedBox(height: screenHeight * 0.01),
              UploadField(
                textOut: "Image Name",
                textIn: "Subtitle name",
                controller: cubit.imageName,
              ),
              SizedBox(height: screenHeight * 0.01),
              UploadField(
                textOut: "Price",
                textIn: "LE 100",
                controller: cubit.price,
              ),
              SizedBox(height: screenHeight * 0.01),
              UploadField(
                textOut: "Description",
                textIn: "your description",
                controller: cubit.description,
              ),
              SizedBox(height: screenHeight * 0.01),
              UploadField(
                textOut: "Location",
                textIn: "your location",
                controller: cubit.location,
              ),
              SizedBox(height: screenHeight * 0.025),
              BlocBuilder<UploadCubit, UploadState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () async {
                      await cubit.uploadImage();
                      Navigator.pushNamed(context, UploadImage.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(390.w, 54.h),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.red, width: 2.w),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: state is UploadLoading
                        ? const CircularProgressIndicator()
                        : Text(
                            "Upload",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff6C563B),
                            ),
                          ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
