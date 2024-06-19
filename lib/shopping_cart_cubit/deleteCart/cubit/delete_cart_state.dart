part of 'delete_cart_cubit.dart';

abstract class DeleteCartState {}

class DeleteCartInitial extends DeleteCartState {}

class DeleteCartLoading extends DeleteCartState {}

class DeleteCartSuccess extends DeleteCartState {
  final DeleteCartResponse response;

  DeleteCartSuccess(this.response);
}

class DeleteCartFailure extends DeleteCartState {
  final String error;

  DeleteCartFailure(this.error);
}
