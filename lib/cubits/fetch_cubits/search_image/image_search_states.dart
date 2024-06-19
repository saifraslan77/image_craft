import 'package:image_craft/models/images_models/image_search/image_search_response.dart';

abstract class SearchStates {}

class SearchInitial extends SearchStates {}

class SearchLoading extends SearchStates {}

class SearchLoaded extends SearchStates {
  final List<ImagesOfSearch> items;

  SearchLoaded(this.items);
}

class SearchError extends SearchStates {
  final String message;

  SearchError(this.message);
}

class ImagesClearedState extends SearchStates {}
