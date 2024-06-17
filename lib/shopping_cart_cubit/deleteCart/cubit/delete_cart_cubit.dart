import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../apis/api_error.dart';
import '../../../repos/cart_repo.dart';
import '../../../shopping_cart_models/delete_cart_response.dart';

part 'delete_cart_state.dart';

class DeleteCartCubit extends Cubit<DeleteCartState> {
  DeleteCartCubit() : super(DeleteCartInitial());

  Future<void> deleteCart() async {
    emit(DeleteCartLoading());
    try {
      var response = await ShoppingCartRepo.deleteCart();
      emit(DeleteCartSuccess(response));
    } on Exception catch (e) {
      String error = APIError.getErrorMessage(e); // مش فاكر اسم ال class بالظبط
      emit(DeleteCartFailure(error));
    }
  }
}