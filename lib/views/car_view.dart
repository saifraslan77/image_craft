import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_craft/models/images_models/fetch_single_image/fetch_single_image_response.dart';
import '../cubits/fetch_cubits/fetch_single_image/image_single_cubit.dart';
import '../cubits/fetch_cubits/fetch_single_image/image_single_states.dart';

class CarView extends StatelessWidget {
  const CarView({super.key});
  static const String routeName = 'car_view';

  @override
  Widget build(BuildContext context) {
    final int? imageId = ModalRoute.of(context)?.settings.arguments as int?;
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => CarImageCubit()..fetchCarImage(imageId!),
          child: BlocBuilder<CarImageCubit, CarImageState>(
            builder: (context, state) {
              final cubit = BlocProvider.of<CarImageCubit>(context);
              if (state is CarImageLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CarImageLoaded) {
                final carImage = state.carImage;
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Column(
                      children: [
                        Stack(
                          children: [
                            Image.network(
                              carImage.imageData.path ?? '',
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                              height: 300,
                            ),
                            Positioned(
                              top: 35,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const SizedBox(width: 24),
                                  SizedBox(
                                    width: 32,
                                    height: 30,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        padding: EdgeInsets.zero,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8.69),
                                          ),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.arrow_back_ios_new_sharp,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: 32,
                                    height: 30,
                                    child: TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        padding: EdgeInsets.zero,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8.69),
                                          ),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.favorite_border_outlined,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 24),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.66,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 0,
                            blurRadius: 20,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  carImage.imageDetails.category ?? '',
                                  style: const TextStyle(
                                    backgroundColor: Color(0xffDCC7AD),
                                    color: Color(0xff6C563B),
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 1),
                                Text(
                                  carImage.imageData.name ?? '',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  ' ${carImage.imageData.price?.toString() ?? ''} LE', // Changed this line
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  cubit.changeIndex(0);
                                  // Toggle description view
                                },
                                child: const Text(
                                  'Description',
                                  style: TextStyle(
                                    color: Color(0xff6C563B),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 90),
                              TextButton(
                                onPressed: () {
                                  cubit.changeIndex(1);
                                  // Toggle details image view
                                },
                                child: const Text(
                                  'Image Details ',
                                  style: TextStyle(
                                    color: Color(0xff6C563B),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            height: 1,
                            color: Color(0xff6C563B),
                          ),
                          Builder(
                            builder: (context) {
                              if (cubit.currentIndex == 0) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 20,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        carImage.imageData.description ?? '',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff1F2023),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/love.png',
                                            width: 25,
                                            height: 25,
                                          ),
                                          const SizedBox(width: 3),
                                          Text(
                                            carImage.imageData.noOfLikes.toString(),
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff1F2023),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 20,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Text(
                                            'Image Height: ',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff1F2023),
                                            ),
                                          ),
                                          Text(
                                            carImage.imageDetails.height.toString(),
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff1F2023),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        children: [
                                          const Text(
                                            'Image Width: ',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff1F2023),
                                            ),
                                          ),
                                          Text(
                                            carImage.imageDetails.width.toString(),
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff1F2023),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        children: [
                                          const Text(
                                            'Image Type: ',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff1F2023),
                                            ),
                                          ),
                                          Text(
                                            carImage.imageDetails.type ?? '',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff1F2023),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        children: [
                                          const Text(
                                            'Upload Date: ',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff1F2023),
                                            ),
                                          ),
                                          Text(
                                            carImage.imageDetails.uploadDate.toString(),
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff1F2023),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        children: [
                                          const Text(
                                            'Location: ',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff1F2023),
                                            ),
                                          ),
                                          Text(
                                            carImage.imageDetails.location ?? '',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff1F2023),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        children: [
                                          const Text(
                                            'Category: ',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff1F2023),
                                            ),
                                          ),
                                          Text(
                                            carImage.imageDetails.category ?? '',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff1F2023),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else if (state is CarImageError) {
                return Center(child: Text(state.message));
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
