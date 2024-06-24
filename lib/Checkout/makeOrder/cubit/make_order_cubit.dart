import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../repos/checkout_repo.dart';
import '../make_order_request.dart';
import '../make_order_response.dart';

part 'make_order_state.dart';

class MakeOrderCubit extends Cubit<MakeOrderState> {
  MakeOrderCubit() : super(MakeOrderInitial());

  Future<void> makeOrder(MakeOrderRequest request) async {
    emit(MakeOrderLoading());
    try {
      var response = await CheckoutRepo.makeOrder(request);
      emit(MakeOrderSuccess(response));
    } on Exception catch (e) {
      emit(MakeOrderFailure(e.toString()));
    }
  }
}