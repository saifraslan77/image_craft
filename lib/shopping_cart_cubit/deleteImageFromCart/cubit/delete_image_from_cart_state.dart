part of 'delete_image_from_cart_cubit.dart';

abstract class DeleteImageFromCartState {}

class DeleteImageFromCartInitial extends DeleteImageFromCartState {}

class DeleteImageFromCartLoading extends DeleteImageFromCartState {}

class DeleteImageFromCartSuccess extends DeleteImageFromCartState {
  final DeleteImageFromCartResponse response;

  DeleteImageFromCartSuccess(this.response);
}

class DeleteImageFromCartFailure extends DeleteImageFromCartState {
  final String error;

  DeleteImageFromCartFailure(this.error);
}
