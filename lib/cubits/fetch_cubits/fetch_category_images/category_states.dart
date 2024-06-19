import 'package:image_craft/models/images_models/fetch_category_images/FetchCategoryImages.dart';

abstract class CategoryStates {}

class CategoryInitial extends CategoryStates {}

class CategoryLoading extends CategoryStates {}

class CategoryLoaded extends CategoryStates {
  final List<CategoryImage> items;

  CategoryLoaded(this.items);
}

class CategoryError extends CategoryStates {
  final String message;

  CategoryError(this.message);
}
