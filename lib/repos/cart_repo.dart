import '../apis/api_service.dart';
import '../apis/api_config.dart';
import '../shopping_cart_models/add_to_cart_response.dart';
import '../shopping_cart_models/delete_cart_response.dart';
import '../shopping_cart_models/delete_image_from_cart_response.dart';
import '../shopping_cart_models/fetch_cart_images_response.dart';

class ShoppingCartRepo {
  static Future<CartImageResponse> fetchCartImages() async {
    try {
      var response = await APIService.get(
        endpoint: APIConfig.cartImages,
        token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwLCJpYXQiOjE3MTkwODY1ODYsImV4cCI6MTcxOTI1OTM4Nn0.JFWFH8LPvjQ0iFAMQp4ynS7QTkgBq67D5mqb3GWCnX0',
      );
      print('API Response: $response'); // تحقق من الاستجابة
      return CartImageResponse.fromJson(response);
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

  static Future<AddToCartResponse> addToCart(String imageId) async {
    try {
      var response = await APIService.post(
        endpoint: APIConfig.addToCart,
        token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwLCJpYXQiOjE3MTkwODY1ODYsImV4cCI6MTcxOTI1OTM4Nn0.JFWFH8LPvjQ0iFAMQp4ynS7QTkgBq67D5mqb3GWCnX0',
        body: {'imageId': imageId},
      );
      return AddToCartResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<DeleteImageFromCartResponse> deleteImageFromCart(String imageId) async {
    try {
      var response = await APIService.delete(
        endpoint: APIConfig.deleteImageFromCart,
        token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwLCJpYXQiOjE3MTkwODY1ODYsImV4cCI6MTcxOTI1OTM4Nn0.JFWFH8LPvjQ0iFAMQp4ynS7QTkgBq67D5mqb3GWCnX0',
        body: {'imageId': imageId},
      );
      var deleteResponse = DeleteImageFromCartResponse.fromJson(response);
      print('Response: $deleteResponse');
      return deleteResponse;
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

  static Future<DeleteCartResponse> deleteCart() async {
    try {
      var response = await APIService.delete(
        endpoint: APIConfig.deleteCart,
        token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwLCJpYXQiOjE3MTkwODY1ODYsImV4cCI6MTcxOTI1OTM4Nn0.JFWFH8LPvjQ0iFAMQp4ynS7QTkgBq67D5mqb3GWCnX0',
      );
      return DeleteCartResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
