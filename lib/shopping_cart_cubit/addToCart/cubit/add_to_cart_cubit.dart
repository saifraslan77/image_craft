import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../apis/api_error.dart';
import '../../../repos/cart_repo.dart';
import '../../../shopping_cart_models/add_to_cart_response.dart';
part 'add_to_cart_state.dart';
class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit() : super(AddToCartInitial());

  Future<void> addToCart(String imageId) async {
    emit(AddToCartLoading());
    try {
      var response = await ShoppingCartRepo.addToCart(imageId);
      emit(AddToCartSuccess(response));
    } on Exception catch (e) {
      String error = APIError.getErrorMessage(e); // مش فاكر اسم ال class بالظبط
      emit(AddToCartFailure(error));
    }
  }
}