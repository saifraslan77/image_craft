import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_craft/cubits/fetch_cubits/search_image/image_search_states.dart';
import 'package:image_craft/models/images_models/image_search/image_search_response.dart';
import 'package:image_craft/repos/images_repo.dart';
import '../../../apis/api_error.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitial());

  List<ImagesOfSearch> images = [];

  final TextEditingController searchController = TextEditingController();

  Future<void> imageSearch(String imageName) async {
    emit(SearchLoading());

    try {
      final response = await ImagesRepo.imageSearch(imageName);
      images.addAll(response.images);
      emit(SearchLoaded(response.images));
    } catch (e) {
      final errorMessage = APIError.getErrorMessage(e as Exception);
      emit(SearchError(errorMessage));
    }
  }

  void clearImages() {
    images.clear();
    emit(ImagesClearedState());
  }
}
