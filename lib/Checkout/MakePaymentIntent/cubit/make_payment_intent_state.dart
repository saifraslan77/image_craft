part of 'make_payment_intent_cubit.dart';

abstract class MakePaymentIntentState {}

class MakePaymentIntentInitial extends MakePaymentIntentState {}

class MakePaymentIntentLoading extends MakePaymentIntentState {}

class MakePaymentIntentSuccess extends MakePaymentIntentState {
  final MakePaymentIntentResponse response;

  MakePaymentIntentSuccess(this.response);
}

class MakePaymentIntentFailure extends MakePaymentIntentState {
  final String error;

  MakePaymentIntentFailure(this.error);
}
