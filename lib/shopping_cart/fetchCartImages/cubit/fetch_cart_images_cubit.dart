import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../apis/api_error.dart';
import '../../../models/auth_models/shopping_cart_models/cart_image_response.dart';
import '../../../repos/cart_repo.dart';
part 'fetch_cart_images_state.dart';

class FetchCartImagesCubit extends Cubit<FetchCartImagesState> {
  FetchCartImagesCubit() : super(FetchCartImagesInitial());

  Future<void> fetchCartImages() async {
    emit(FetchCartImagesLoading());
    try {
      var response = await ShoppingCartRepo.fetchCartImages();
      emit(FetchCartImagesSuccess(response));
    } on Exception catch (e) {
      String error = APIError.getErrorMessage(e); // مش فاكر اسم ال class بالظبط
      emit(FetchCartImagesFailure(error));
      }
      }
}