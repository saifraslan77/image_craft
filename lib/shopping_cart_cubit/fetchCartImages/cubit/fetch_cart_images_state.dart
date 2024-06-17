part of 'fetch_cart_images_cubit.dart';

abstract class FetchCartImagesState {}

class FetchCartImagesInitial extends FetchCartImagesState {}

class FetchCartImagesLoading extends FetchCartImagesState {}

class FetchCartImagesSuccess extends FetchCartImagesState {
  final CartImageResponse response;

  FetchCartImagesSuccess(this.response);
}

class FetchCartImagesFailure extends FetchCartImagesState {
  final String error;

  FetchCartImagesFailure(this.error);
}
