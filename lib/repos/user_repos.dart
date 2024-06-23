import '../apis/api_config.dart';
import '../apis/api_service.dart';
import '../models/user_models/liked_images_response.dart';
import '../models/user_models/load_user_profile_response.dart';
import '../models/user_models/ordered_images_response.dart';
import '../models/user_models/uploaded_images_response.dart';

class UserRepo {
  static Future<LikedImagesResponse> fetchLikedImages() async {
    Map<String, dynamic> response = await APIService.get(
      endpoint: APIConfig.fetchLikedImages,
      token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIyLCJpYXQiOjE3MTkxMzY4OTQsImV4cCI6MTcxOTMwOTY5NH0.HDwaW65Sr8D6DF3cttfgR58B25_5VC9jOEVkIzq_LU4',
    );
    return LikedImagesResponse.fromJson(response);
  }

  static Future<UploadedImagesResponse> fetchUploadedImages() async {
    Map<String, dynamic> response = await APIService.get(
      endpoint: APIConfig.fetchUploadedImages,
      token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIyLCJpYXQiOjE3MTkxMzY4OTQsImV4cCI6MTcxOTMwOTY5NH0.HDwaW65Sr8D6DF3cttfgR58B25_5VC9jOEVkIzq_LU4',
    );
    return UploadedImagesResponse.fromJson(response);
  }


  static Future<OrderedImagesResponse> fetchOrderedImages() async {
    Map<String, dynamic> response = await APIService.get(
      endpoint: APIConfig.fetchOrderedImages,
      token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIyLCJpYXQiOjE3MTkxMzY4OTQsImV4cCI6MTcxOTMwOTY5NH0.HDwaW65Sr8D6DF3cttfgR58B25_5VC9jOEVkIzq_LU4',
    );
    return OrderedImagesResponse.fromJson(response);
  }
  static Future<LoadUserProfileResponse> loadUserProfile() async {
    Map<String, dynamic> response = await APIService.get(
      endpoint: APIConfig.loadUserProfile,
      token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIyLCJpYXQiOjE3MTkxMzY4OTQsImV4cCI6MTcxOTMwOTY5NH0.HDwaW65Sr8D6DF3cttfgR58B25_5VC9jOEVkIzq_LU4',
    );
    print('500000000000000005');
    print(response);
    return LoadUserProfileResponse.fromJson(response);
}}
