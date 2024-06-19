import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_craft/repos/images_repo.dart';
import '../../../apis/api_error.dart';
import '../../../models/images_models/fetch_single_image/fetch_single_image_response.dart';
import 'image_single_states.dart'; // Import the model classes

class CarImageCubit extends Cubit<CarImageState> {
  CarImageCubit() : super(CarImageInitial());
  int currentIndex = 0;

  void changeIndex(int index) {
  if (index == currentIndex) return;
    currentIndex = index;
    emit(ChangeIndex());
  }

  Future<void> fetchCarImage(int imageId) async {
    emit(CarImageLoading());
    try {
      final carImage = await ImagesRepo.fetchSingleImage(imageId);
      emit(CarImageLoaded(carImage));
    } on Exception catch (e) {
      final errorMessage = APIError.getErrorMessage(e);
      emit(CarImageError(errorMessage));
    }
  }
}

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:image_craft/repos/images_repo.dart';
// import '../../../models/images_models/fetch_single_image/fetch_single_image_response.dart';
// import 'image_single_states.dart'; // Import the model classes
//
//
// class CarImageCubit extends Cubit<CarImageState> {
//   // final Dio _dio;
//
//   CarImageCubit() : super(CarImageInitial());
//
//   Future<void> fetchCarImage(int imageId) async {
//     emit(CarImageLoading());
//     try {
//       // final response = await _dio.get(
//       //   'http://localhost:5000/api/v1/image/',
//       //   queryParameters: {'imageId': imageId},
//       // );
//       final response = await ImagesRepo.fetchSingleImages(imageId);
//       final carImage = CarImage.fromJson(response.imageDetails);
//       emit(CarImageLoaded(carImage));
//     } catch (e) {
//       emit(CarImageError('Failed to fetch car image: ${e.toString()}'));
//     }
//   }
// }
