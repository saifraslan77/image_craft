// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_craft/cubits/user_cubits/profile_images_states.dart';
// import 'package:image_craft/repos/user_repos.dart';
//
// class ProfileImagesCubit extends Cubit<ProfileImagesState> {
//   ProfileImagesCubit() : super(ProfileImagesInitial());
//
//   void fetchLikedImages() async {
//     try {
//       emit(ProfileImagesLoading());
//       final likedImages = await UserRepos.fetchLikedImages();
//       emit(LikedImagesLoaded(likedImages));
//     } catch (e) {
//       emit(ProfileImagesError(e.toString()));
//     }
//   }
//
//   void fetchUploadedImages() async {
//     try {
//       emit(ProfileImagesLoading());
//       final uploadedImages = await UserRepos.fetchUploadedImages();
//       emit(UploadedImagesLoaded(uploadedImages));
//     } catch (e) {
//       emit(ProfileImagesError(e.toString()));
//     }
//   }
//
//   void fetchOrderedImages() async {
//     try {
//       emit(ProfileImagesLoading());
//       final orderedImages = await UserRepos.fetchOrderedImages();
//       emit(OrderedImagesLoaded(orderedImages));
//     } catch (e) {
//       emit(ProfileImagesError(e.toString()));
//     }
//   }
// }
//
//
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_craft/cubits/user_cubits/profile_images_states.dart';
import '../../apis/api_error.dart';
import '../../models/user_models/image_model.dart';
import '../../repos/user_repos.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  List<ImageModel> likedImages = [];
  List<ImageModel> uploadedImages = [];
  List<ImageModel> orderedImages = [];

  Future<void> fetchLikedImages() async {
    try {
      emit(GetLikedLoading());
      final response = await UserRepo.fetchLikedImages();
      likedImages.clear();
      likedImages.addAll(response.data);
      emit(GetLikedLoaded(response));
    } on Exception catch (e) {
      final errorMessage = APIError.getErrorMessage(e);
      emit(GetLikedError(errorMessage));
    }
  }

  Future<void> fetchUploadedImages() async {
    try {
      emit(GetUploadedLoading());
      final response = await UserRepo.fetchUploadedImages();
      uploadedImages.clear();
      uploadedImages.addAll(response.data);
      emit(GetUploadedLoaded(response));
    } on Exception catch (e) {
      final errorMessage = APIError.getErrorMessage(e);
      emit(GetUploadedError(errorMessage));
    }
  }

  Future<void> fetchOrderedImages() async {
    try {
      emit(GetOrderedLoading());
      final response = await UserRepo.fetchOrderedImages();
      orderedImages.clear();
      orderedImages.addAll(response.data);
      emit(GetOrderedLoaded(response));
    } on Exception catch (e) {
      final errorMessage = APIError.getErrorMessage(e);
      emit(GetOrderedError(errorMessage));
    }
  }
  Future<void> loadUserProfile() async {
    try {
      emit(LoadUserLoading());
      final response = await UserRepo.loadUserProfile();
      emit(LoadUserLoaded(response));
    } on Exception catch (e) {
      final errorMessage = APIError.getErrorMessage(e);
      emit(GetOrderedError(errorMessage));
    }
  }
}
