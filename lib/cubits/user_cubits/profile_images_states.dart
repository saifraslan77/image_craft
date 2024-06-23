// import '../../models/user_models/liked_images_response.dart';
// import '../../models/user_models/ordered_images_response.dart';
// import '../../models/user_models/uploaded_images_response.dart';
//
// abstract class ProfileImagesState {
//   ProfileImagesState();
//
//   @override
//   List<Object> get props => [];
// }
//
// class ProfileImagesInitial extends ProfileImagesState {}
//
// class ProfileImagesLoading extends ProfileImagesState {}
//
// class LikedImagesLoaded extends ProfileImagesState {
//   final LikedImagesResponse likedImagesResponse;
//
//   LikedImagesLoaded(this.likedImagesResponse);
//
//   @override
//   List<Object> get props => [likedImagesResponse];
// }
//
// class UploadedImagesLoaded extends ProfileImagesState {
//   final UploadedImagesResponse uploadedImagesResponse;
//
//   UploadedImagesLoaded(this.uploadedImagesResponse);
//
//   @override
//   List<Object> get props => [uploadedImagesResponse];
// }
//
// class OrderedImagesLoaded extends ProfileImagesState {
//   final OrderedImagesResponse orderedImagesResponse;
//
//   OrderedImagesLoaded(this.orderedImagesResponse);
//
//   @override
//   List<Object> get props => [orderedImagesResponse];
// }
//
// class ProfileImagesError extends ProfileImagesState {
//   final String error;
//
//   ProfileImagesError(this.error);
//
//   @override
//   List<Object> get props => [error];
// }

import '../../models/user_models/liked_images_response.dart';
import '../../models/user_models/load_user_profile_response.dart';
import '../../models/user_models/ordered_images_response.dart';
import '../../models/user_models/uploaded_images_response.dart';

abstract class ProfileState {
  const ProfileState();

  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class GetLikedLoading extends ProfileState {}

class GetLikedLoaded extends ProfileState {
  final LikedImagesResponse response;

  const GetLikedLoaded(this.response);

  @override
  List<Object> get props => [response];
}

class GetLikedError extends ProfileState {
  final String message;

  const GetLikedError(this.message);

  @override
  List<Object> get props => [message];
}

class GetUploadedLoading extends ProfileState {}

class GetUploadedLoaded extends ProfileState {
  final UploadedImagesResponse response;

  GetUploadedLoaded(this.response);
}

class GetUploadedError extends ProfileState {
  final String message;

  const GetUploadedError(this.message);

  @override
  List<Object> get props => [message];
}

class GetOrderedLoading extends ProfileState {}

class GetOrderedLoaded extends ProfileState {
  final OrderedImagesResponse response;

  GetOrderedLoaded(this.response);
}

class GetOrderedError extends ProfileState {
  final String message;

  const GetOrderedError(this.message);

  @override
  List<Object> get props => [message];
}
class LoadUserLoading extends ProfileState {}

class LoadUserLoaded extends ProfileState {
  final LoadUserProfileResponse response;

  LoadUserLoaded(this.response);
}

class LoadUserError extends ProfileState {
  final String message;

  const LoadUserError(this.message);

  @override
  List<Object> get props => [message];
}
