import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../apis/api_error.dart';
import '../../../repos/cart_repo.dart';
import '../../../shopping_cart_models/delete_image_from_cart_response.dart';

part 'delete_image_from_cart_state.dart';

class DeleteImageFromCartCubit extends Cubit<DeleteImageFromCartState> {
  DeleteImageFromCartCubit() : super(DeleteImageFromCartInitial());

  Future<void> deleteImageFromCart(String imageId) async {
    emit(DeleteImageFromCartLoading());
    try {
      var response = await ShoppingCartRepo.deleteImageFromCart(imageId);
      emit(DeleteImageFromCartSuccess(response));
    } on Exception catch (e) {
      String error = APIError.getErrorMessage(e);
      emit(DeleteImageFromCartFailure(error));
    }
  }
}
