// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../cubits/user_cubits/profile_images_cubit.dart';
// import '../cubits/user_cubits/profile_images_states.dart';
//
// class ProfileView extends StatelessWidget {
//   const ProfileView({super.key});
//
//   Widget _buildGridView(List<String> imagePaths) {
//     return GridView.builder(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//         mainAxisSpacing: 3,
//         crossAxisSpacing: 2,
//         childAspectRatio: 2 / 3,
//       ),
//       itemCount: imagePaths.length,
//       itemBuilder: (BuildContext context, int index) {
//         return Container(
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: Colors.white,
//               width: 2.0,
//             ),
//           ),
//           child: Image.network(
//             imagePaths[index],
//             fit: BoxFit.cover,
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => ProfileImagesCubit(),
//       child: DefaultTabController(
//         length: 3,
//         child: Scaffold(
//           body: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               const SizedBox(
//                 height: 20,
//               ),
//               Center(
//                 child: Container(
//                   width: 100,
//                   height: 100,
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                   ),
//                   child: ClipOval(
//                     child: Image.asset(
//                       'assets/profile.jpeg',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'assets/icon.png',
//                     height: 20,
//                     width: 20,
//                   ),
//                   const SizedBox(
//                     width: 3,
//                   ),
//                   const Text(
//                     'YoussefAmin4050',
//                     style: TextStyle(
//                         color: Color(0xff6C563B),
//                         fontSize: 15,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ],
//               ),
//               const Text(
//                 '0 followers . 0 following',
//                 style: TextStyle(
//                     fontSize: 11,
//                     fontWeight: FontWeight.w500,
//                     color: Color(0xff6C563B)),
//               ),
//               const SizedBox(
//                 height: 3,
//               ),
//               Container(
//                 height: 25,
//                 width: 120,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: const Color(0xff987854)),
//                 child: TextButton(
//                   onPressed: () {},
//                   child: const Text(
//                     'Edit Profile',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 10,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),
//               ),
//               const TabBar(
//                 indicatorColor: Color(0xff987854),
//                 indicatorWeight: 2,
//                 tabs: [
//                   Tab(
//                     icon: Icon(
//                       Icons.image,
//                       color: Color(0xff987854),
//                     ),
//                   ),
//                   Tab(
//                     icon: Icon(
//                       Icons.upload,
//                       color: Color(0xff987854),
//                     ),
//                   ),
//                   Tab(
//                     icon: Icon(
//                       Icons.favorite,
//                       color: Color(0xff987854),
//                     ),
//                   ),
//                 ],
//               ),
//               Expanded(
//                 child: TabBarView(
//                   children: [
//                     BlocBuilder<ProfileImagesCubit, ProfileImagesState>(
//                       builder: (context, state) {
//                         if (state is ProfileImagesLoading) {
//                           return const Center(
//                             child: CircularProgressIndicator(),
//                           );
//                         } else if (state is LikedImagesLoaded) {
//                           return _buildGridView(state.likedImagesResponse.data
//                               .map((image) => image.imagePath)
//                               .toList());
//                         } else if (state is ProfileImagesError) {
//                           return Center(
//                             child: Text('Error: ${state.error}'),
//                           );
//                         } else {
//                           return const Center(
//                             child: Text('No liked images'),
//                           );
//                         }
//                       },
//                     ),
//                     BlocBuilder<ProfileImagesCubit, ProfileImagesState>(
//                       builder: (context, state) {
//                         final cubit = BlocProvider.of<ProfileImagesCubit>(context) ;
//                         if (state is ProfileImagesLoading) {
//                           return const Center(
//                             child: CircularProgressIndicator(),
//                           );
//                         } else if (state is UploadedImagesLoaded) {
//                           return _buildGridView(state
//                               .uploadedImagesResponse.data
//                               .map((image) => image.imagePath)
//                               .toList());
//                         } else if (state is ProfileImagesError) {
//                           return Center(
//                             child: Text('Error: ${state.error}'),
//                           );
//                         } else {
//                           return const Center(
//                             child: Text('No uploaded images'),
//                           );
//                         }
//                       },
//                     ),
//                     BlocBuilder<ProfileImagesCubit, ProfileImagesState>(
//                       builder: (context, state) {
//                         if (state is ProfileImagesLoading) {
//                           return const Center(
//                             child: CircularProgressIndicator(),
//                           );
//                         } else if (state is OrderedImagesLoaded) {
//                           return _buildGridView(state.orderedImagesResponse.data
//                               .map((image) => image.imagePath)
//                               .toList());
//                         } else if (state is ProfileImagesError) {
//                           return Center(
//                             child: Text('Error: ${state.error}'),
//                           );
//                         } else {
//                           return const Center(
//                             child: Text('No ordered images'),
//                           );
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubits/user_cubits/profile_images_cubit.dart';
import '../cubits/user_cubits/profile_images_states.dart';
import '../models/user_models/image_model.dart';
import 'camera_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  Widget _buildGridView(List<ImageModel> images, Future<void> function) {
    return RefreshIndicator(
      onRefresh: () async {
        await function;
      },
      child: GridView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 8.w,
          childAspectRatio: 2 / 3,
          mainAxisExtent: 80,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Image.network(
            images[index].imagePath,
            fit: BoxFit.fill,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BlocBuilder<ProfileCubit, ProfileState>(
              buildWhen: (previous, current) {
                return current is LoadUserLoaded ||
                    current is LoadUserLoading ||
                    current is LoadUserError;
              },
              builder: (context, state) {
                if (state is LoadUserLoaded) {
                  final user = state.response;
                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            user.userInfo?.imageProfilePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icon.png',
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            user.userInfo?.username ?? '',
                            style: const TextStyle(
                              color: Color(0xff6C563B),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "${user.userInfo!.followingNum.toString()}following.${user.userInfo!.followersNum.toString()}followers",
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff6C563B),
                        ),
                      ),
                      const SizedBox(height: 3),
                    ],
                  );
                } else if (state is LoadUserError) {
                  return Center(child: Text(state.message));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            Container(
              height: 25,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff987854),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CameraWidget(),
                    ),
                  );
                },
                child: const Text(
                  'Edit image profile',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xffFFFFFF),
                    height: .4,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    size: 30,
                    color: Color(0xff987854),
                  ),
                ),
                Tab(
                  icon: Image.asset('assets/upload_icon.jpg'),
                ),
                Tab(
                  icon: Image.asset('assets/ordered_icon.jpg'),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      final cubit = BlocProvider.of<ProfileCubit>(context);
                      if (state is GetLikedLoading &&
                          cubit.likedImages.isEmpty) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is GetLikedLoaded &&
                          cubit.likedImages.isEmpty) {
                        return const Center(child: Text('No Data'));
                      } else if (state is GetLikedError &&
                          cubit.likedImages.isEmpty) {
                        return Center(child: Text(state.message));
                      } else {
                        return _buildGridView(
                            cubit.likedImages, cubit.fetchLikedImages());
                      }
                    },
                  ),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      final cubit = BlocProvider.of<ProfileCubit>(context);
                      if (state is GetUploadedLoading &&
                          cubit.uploadedImages.isEmpty) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is GetUploadedLoaded &&
                          cubit.uploadedImages.isEmpty) {
                        return const Center(child: Text('No Data'));
                      } else if (state is GetUploadedError &&
                          cubit.uploadedImages.isEmpty) {
                        return Center(child: Text(state.message));
                      } else {
                        return _buildGridView(
                            cubit.uploadedImages, cubit.fetchUploadedImages());
                      }
                    },
                  ),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      final cubit = BlocProvider.of<ProfileCubit>(context);
                      if (state is GetOrderedLoading &&
                          cubit.orderedImages.isEmpty) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is GetOrderedLoaded &&
                          cubit.orderedImages.isEmpty) {
                        return const Center(child: Text('No Data'));
                      } else if (state is GetOrderedError &&
                          cubit.orderedImages.isEmpty) {
                        return Center(child: Text(state.message));
                      } else {
                        return _buildGridView(
                            cubit.orderedImages, cubit.fetchOrderedImages());
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
