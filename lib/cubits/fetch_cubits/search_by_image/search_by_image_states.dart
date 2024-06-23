
import '../../../models/images_models/upload_model/upload_response.dart';

abstract class SearchByImageStates  {
  const SearchByImageStates();
}

class SearchByImageInitial extends SearchByImageStates {}

class SearchByImageLoading extends SearchByImageStates {}

class SearchByImageSuccess extends SearchByImageStates {
  final UploadImageResponse response;

  const SearchByImageSuccess(this.response);
}

class SearchByImageFailure extends SearchByImageStates {
  final String error;

  const SearchByImageFailure(this.error);
}

class SelectImage extends SearchByImageStates {}
