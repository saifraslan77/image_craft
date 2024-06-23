import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_craft/cubits/fetch_cubits/fetch_category_images/category_cubit.dart';
import 'package:image_craft/views/categories_item.dart';
import '../cubits/fetch_cubits/fetch_category_images/category_states.dart';

class CategoryScreen extends StatelessWidget {
  static const String routeName = "categories_item";

  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String name = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      backgroundColor: const Color(0xffDCC7AD),
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: const Color(0xffDCC7AD),
        title: Center(child: Image.asset("assets/image_craft.png")),
      ),
      body: BlocProvider(
        create: (context) => CategoryCubit()..fetchCategories(name),
        child: BlocBuilder<CategoryCubit, CategoryStates>(
          builder: (context, state) {
            final cubit = BlocProvider.of<CategoryCubit>(context);
            if (state is CategoryLoading && cubit.images.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CategoryError && cubit.images.isEmpty) {
              return Center(child: Text(state.message));
            } else if (state is CategoryLoaded && cubit.images.isEmpty) {
              return const Center(child: Text('No items available'));
            } else {
              return GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 0.8,
                ),
                itemCount: cubit.images.length,
                itemBuilder: (context, index) {
                  final datum = cubit.images[index];
                  return CategoryItem(
                    datum: datum,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
