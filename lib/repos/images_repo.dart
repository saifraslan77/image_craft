import 'package:dio/dio.dart';
import 'package:image_craft/models/images_models/fetch_images/fetch_images_response.dart';
import 'package:image_craft/models/images_models/fetch_single_image/fetch_single_image_response.dart';
import 'package:http_parser/http_parser.dart';
import '../apis/api_config.dart';
import '../apis/api_service.dart';
import '../models/images_models/fetch_category_images/FetchCategoryImages.dart';
import '../models/images_models/image_search/image_search_response.dart';
import '../models/images_models/upload_model/upload_request.dart';
import '../models/images_models/upload_model/upload_response.dart';

class ImagesRepo {
  static Future<FetchImagesResponse> fetchImages(int page) async {
    Map<String, dynamic> response = await APIService.get(
      endpoint: APIConfig.fetchImages,
      params: {'page': page},
    );
    return FetchImagesResponse.fromJson(response);
  }

  static Future<CarImage> fetchSingleImage(int imageId) async {
    Map<String, dynamic> response = await APIService.get(
      endpoint: APIConfig.fetchSingleImage,
      params: {'imageId': imageId},
    );
    return CarImage.fromJson(response);
  }

  static Future<FetchCategoryImagesResponse> fetchCategoryImages(
    String category,
  ) async {
    Map<String, dynamic> response = await APIService.get(
        endpoint: APIConfig.fetchCategoryImages + category);
    return FetchCategoryImagesResponse.fromJson(response);
  }

  static Future<SearchImageResponse> imageSearch(String imageName) async {
    Map<String, dynamic> response = await APIService.get(
      endpoint: APIConfig.imageSearch,
      params: {'imageName': imageName},
    );
    return SearchImageResponse.fromJson(response);
  }

  static Future<UploadImageResponse> uploadImage({
    required UploadImageRequest request,
    required String imagePath,
  }) async {
    FormData formData = FormData.fromMap(request.toJson());
    formData.files.add(
      MapEntry(
        'image',
        await MultipartFile.fromFile(
          imagePath,
          filename: imagePath.split('/').last,
          contentType: MediaType('image', imagePath.split('.').last),
        ),
      ),
    );
    Map<String, dynamic> response = await APIService.sendFormData(
      endpoint: APIConfig.uploadImage,
      formData: formData,
      token:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwLCJpYXQiOjE3MTg3NzM2MTgsImV4cCI6MTcxODk0NjQxOH0.3ajc-K0H92eh_nAnmbsk4YeksiwvTaG1tcTL8qxUimg',
    );
    print('======');
    print(response);
    return UploadImageResponse.fromJson(response);
  }

  static Future<String> likeImage(int imageId) async {
    Map<String, dynamic> response = await APIService.post(
      endpoint: APIConfig.likeImage + imageId.toString(),
      token:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwLCJpYXQiOjE3MTg3NzM2MTgsImV4cCI6MTcxODk0NjQxOH0.3ajc-K0H92eh_nAnmbsk4YeksiwvTaG1tcTL8qxUimg',
    );
    print('ayyy');
    return 'Image Liked Successfully';
  }
}
