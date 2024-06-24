import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repos/checkout_repo.dart';
import '../make_payment_intent_request.dart';
import '../make_payment_intent_response.dart';

part 'make_payment_intent_state.dart';

class MakePaymentIntentCubit extends Cubit<MakePaymentIntentState> {
  MakePaymentIntentCubit() : super(MakePaymentIntentInitial());

  Future<void> makePaymentIntent(MakePaymentIntentRequest request) async {
    emit(MakePaymentIntentLoading());
    try {
      var response = await CheckoutRepo.makePaymentIntent(request);
      emit(MakePaymentIntentSuccess(response));
    } on Exception catch (e) {
      emit(MakePaymentIntentFailure(e.toString()));
    }
  }
}