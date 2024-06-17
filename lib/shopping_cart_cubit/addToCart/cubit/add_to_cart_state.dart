part of 'add_to_cart_cubit.dart';

abstract class AddToCartState {}

class AddToCartInitial extends AddToCartState {}

class AddToCartLoading extends AddToCartState {}

class AddToCartSuccess extends AddToCartState {
  final AddToCartResponse response;

  AddToCartSuccess(this.response);
}

class AddToCartFailure extends AddToCartState {
  final String error;

  AddToCartFailure(this.error);
}
