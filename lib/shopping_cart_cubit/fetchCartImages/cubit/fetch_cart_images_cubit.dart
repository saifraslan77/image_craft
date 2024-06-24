import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../apis/api_error.dart';
import '../../../repos/cart_repo.dart';
import '../../../shopping_cart_models/fetch_cart_images_response.dart';

part 'fetch_cart_images_state.dart';

class FetchCartImagesCubit extends Cubit<FetchCartImagesState> {
  FetchCartImagesCubit() : super(FetchCartImagesInitial());

  Future<void> fetchCartImages() async {
    emit(FetchCartImagesLoading());
    try {
      var response = await ShoppingCartRepo.fetchCartImages();
      print('Response: ${response.toJson()}'); // تحقق من الاستجابة
      emit(FetchCartImagesSuccess(response));
    } catch (e) {
      String error = APIError.getErrorMessage(e as Exception); // استخدم as Exception هنا
      print('Error: $error'); // تحقق من الخطأ
      emit(FetchCartImagesFailure(error));
    }
  }
}
