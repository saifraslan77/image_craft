import '../apis/api_service.dart';
import '../apis/api_config.dart';
import '../models/auth_models/shopping_cart_models/cart_image_response.dart';
import '../shopping_cart/addToCart/add_to_cart_response.dart';
import '../shopping_cart/deleteCart/delete_cart_response.dart';
import '../shopping_cart/deleteImageFromCart/delete_image_from_cart_response.dart';
class ShoppingCartRepo {
  static Future<CartImageResponse> fetchCartImages() async {
    try {
      var response = await APIService.get(
        endpoint: APIConfig.cartImages,
        token: '',
      );
      return CartImageResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<AddToCartResponse> addToCart(String imageId) async {
    try {
      var response = await APIService.post(
        endpoint: APIConfig.addToCart,
        token: '',
        body: {'imageId': imageId},
      );
      return AddToCartResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<DeleteImageFromCartResponse> deleteImageFromCart(String imageId) async {
    try {
      var response = await APIService.patch(
        endpoint: APIConfig.deleteImageFromCart,
        token: '',
        body: {'imageId': imageId},
      );
      return DeleteImageFromCartResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<DeleteCartResponse> deleteCart() async {
    try {
      var response = await APIService.delete(
        endpoint: APIConfig.deleteCart,
        token: '',
      );
      return DeleteCartResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}