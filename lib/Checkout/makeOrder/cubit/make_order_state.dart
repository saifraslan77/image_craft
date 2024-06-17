part of 'make_order_cubit.dart';

abstract class MakeOrderState {}

class MakeOrderInitial extends MakeOrderState {}

class MakeOrderLoading extends MakeOrderState {}

class MakeOrderSuccess extends MakeOrderState {
  final MakeOrderResponse response;

  MakeOrderSuccess(this.response);
}

class MakeOrderFailure extends MakeOrderState {
  final String error;

  MakeOrderFailure(this.error);
}
