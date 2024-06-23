import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_craft/repos/images_repo.dart';
import '../../../apis/api_error.dart';
import 'image_single_states.dart';

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

  Future<void> likeImage(int imageId) async {
    emit(LikeItemLoading());
    try {
      await ImagesRepo.likeImage(imageId);
      emit(LikeItemLoaded());
    } on Exception catch (e) {
      String error = APIError.getErrorMessage(e);
      emit(LikeItemError(error));
    }
  }
}
