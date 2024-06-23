import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_craft/repos/images_repo.dart';
import '../../../apis/api_error.dart';
import '../../../models/images_models/fetch_category_images/FetchCategoryImages.dart';
import 'category_states.dart';

class CategoryCubit extends Cubit<CategoryStates> {
  CategoryCubit() : super(CategoryInitial());

    List<CategoryImage> images = [];

  Future<void> fetchCategories(String category) async {
    emit(CategoryLoading());
    try {
      final response = await ImagesRepo.fetchCategoryImages(category);
      print(response.data.length);
      images.addAll(response.data);
      emit(CategoryLoaded(response.data));
    } on Exception catch (e) {
      final errorMessage = APIError.getErrorMessage(e);
      emit(CategoryError(errorMessage));
    }
  }
}
