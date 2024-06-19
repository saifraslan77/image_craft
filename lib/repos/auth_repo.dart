import '../apis/api_config.dart';
import '../models/auth_models/login_models/login_request.dart';
import '../models/auth_models/login_models/login_response.dart';
import '../models/auth_models/new_password_models/new_password_request.dart';
import '../models/auth_models/new_password_models/new_password_response.dart';
import '../models/auth_models/register_models/register_request.dart';
import '../models/auth_models/register_models/register_response.dart';
import '../apis/api_service.dart';
import '../models/auth_models/reset_password _models/reset_password_request.dart';

class AuthRepo {
  static Future<LoginResponse> login(LoginRequest request) async {
    try {
      Map<String, dynamic> response = await APIService.post(
        endpoint: APIConfig.login,
        body: request.toJson(),
      );
      return LoginResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      Map<String, dynamic> response = await APIService.post(
        endpoint: APIConfig.register,
        body: request.toJson(),
      );
      return RegisterResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> resetPassword(ResetPasswordRequest request) async {
    try {
      await APIService.post(
        endpoint: APIConfig.resetPassword,
        body: request.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> verifyOTP(ResetPasswordRequest request) async {
    try {
      await APIService.post(
        endpoint: APIConfig.verifyOTP,
        body: request.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }
  static Future<SetNewPasswordResponse> setNewPassword(
      SetNewPasswordRequest request) async {
    try {
      Map<String, dynamic> response = await APIService.patch(
        endpoint: APIConfig.setNewPassword,
        body: request.toJson(),
      );
      return SetNewPasswordResponse.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}