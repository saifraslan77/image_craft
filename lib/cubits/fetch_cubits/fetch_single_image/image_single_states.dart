
import '../../../models/images_models/fetch_single_image/fetch_single_image_response.dart';

abstract class CarImageState {}

class CarImageInitial extends CarImageState {}

class CarImageLoading extends CarImageState {}

class CarImageLoaded extends CarImageState {
  final CarImage carImage;

  CarImageLoaded(this.carImage);
}

class CarImageError extends CarImageState {
  final String message;

  CarImageError(this.message);
}
class ChangeIndex extends CarImageState{
}
