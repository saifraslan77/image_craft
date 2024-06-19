
import '../../../models/images_models/upload_model/upload_response.dart';

abstract class UploadState  {
  const UploadState();

  @override
  List<Object> get props => [];
}

class UploadInitial extends UploadState {}

class UploadLoading extends UploadState {}

class UploadSuccess extends UploadState {
  final UploadImageResponse response;

  const UploadSuccess(this.response);

  @override
  List<Object> get props => [response];
}

class UploadFailure extends UploadState {
  final String error;

  const UploadFailure(this.error);

  @override
  List<Object> get props => [error];
}

class ImageSelected extends UploadState {}
