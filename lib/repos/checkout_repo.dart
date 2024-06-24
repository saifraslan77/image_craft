import '../Checkout/MakePaymentIntent/make_payment_intent_request.dart';
import '../Checkout/MakePaymentIntent/make_payment_intent_response.dart';
import '../Checkout/makeOrder/make_order_request.dart';
import '../Checkout/makeOrder/make_order_response.dart';
import '../apis/api_config.dart';
import '../apis/api_service.dart';

class CheckoutRepo {
  static Future<MakePaymentIntentResponse> makePaymentIntent(MakePaymentIntentRequest request) async {
    try {
      Map<String, dynamic> response = await APIService.post(
        endpoint: APIConfig.makePaymentIntent,
        token: '',
        body: request.toJson(),
      );
      return MakePaymentIntentResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<MakeOrderResponse> makeOrder(MakeOrderRequest request) async {
    try {
      Map<String, dynamic> response = await APIService.post(
        endpoint: APIConfig.makeOrder,
        token: '',
        body: request.toJson(),
      );
      return MakeOrderResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}