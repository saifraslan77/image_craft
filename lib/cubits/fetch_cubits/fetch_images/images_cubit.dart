import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_craft/repos/images_repo.dart';
import '../../../apis/api_error.dart';
import '../../../apis/api_service.dart';
import '../../../models/images_models/fetch_images/item.dart';
import 'images_states.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit() : super(ItemInitial());

  List<Item> items = [];

  Future<void> fetchItems({int page = 1}) async {
    emit(ItemLoading());
    try {
      final response = await ImagesRepo.fetchImages(page);
      items.addAll(response.items ?? []);
      emit(ItemLoaded(response.items));
    } catch (e) {
      final errorMessage = APIError.getErrorMessage(e as Exception);
      emit(ItemError(errorMessage));
    }
  }

  Future<void> likeImage(int imageId) async {
    emit(LikeItemLoading());
    try {
      var response = await ImagesRepo.likeImage(imageId);
      emit(LikeItemLoaded());
    } on Exception catch (e) {
      String error = APIError.getErrorMessage(e);
      print(error);
      emit(LikeItemError(error));
    }
  }
}
