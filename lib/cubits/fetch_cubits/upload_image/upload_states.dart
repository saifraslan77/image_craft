
import '../../../models/images_models/upload_model/upload_response.dart';

abstract class UploadState  {
  const UploadState();
}

class UploadInitial extends UploadState {}

class UploadLoading extends UploadState {}

class UploadSuccess extends UploadState {
  final UploadImageResponse response;

  const UploadSuccess(this.response);
}

class UploadFailure extends UploadState {
  final String error;

  const UploadFailure(this.error);
}

class ImageSelected extends UploadState {}
