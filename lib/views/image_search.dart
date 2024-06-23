import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_craft/views/search_item.dart';

import '../cubits/fetch_cubits/search_image/image_search_cubit.dart';
import '../cubits/fetch_cubits/search_image/image_search_states.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  static const String routeName = 'image-search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDCC7AD),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter Image Name' ,
                        focusedBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)) ,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      controller: BlocProvider.of<SearchCubit>(context)
                          .searchController,
                      onFieldSubmitted: (value) {
                        BlocProvider.of<SearchCubit>(context).imageSearch(
                          value.trim(),
                        );
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      BlocProvider.of<SearchCubit>(context)
                          .searchController
                          .clear();
                      BlocProvider.of<SearchCubit>(context).clearImages();
                    },
                  ),
                ],
              ),
              Expanded(
                child: BlocBuilder<SearchCubit, SearchStates>(
                  builder: (context, state) {
                    final cubit = BlocProvider.of<SearchCubit>(context);
                    if (state is SearchLoading && cubit.images.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is SearchError && cubit.images.isEmpty) {
                      return Center(child: Text(state.message));
                    } else if (state is SearchLoaded && cubit.images.isEmpty) {
                      return const Center(child: Text('No items available'));
                    } else {
                      return GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 24.w,
                          mainAxisSpacing: 15.h,
                          childAspectRatio: 0.85,
                        ),
                        itemCount: cubit.images.length,
                        itemBuilder: (context, index) {
                          final item = cubit.images[index];
                          return InkWell(
                            onTap: () {},
                            child: SearchItem(
                              item: item,
                              index: index,
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
