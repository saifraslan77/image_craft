
class APIConfig {
  static const String baseUrl = 'https://image-craft-cvnj.onrender.com/api/v1/';
  static const String register = 'signup';
  static const String login = 'login/:device';
  static const String resetPassword = 'passwordReset';
  static const String requestOTP = 'otp-verification/?userId=4';
  static const String verifyOTP = 'otp-verification/?userId=4';
  static const String fetchImages = 'images';
  static const String fetchSingleImage = 'image/';
  static const String fetchCategoryImages = 'images/caterogy/';
  static const String imageSearch = 'images/search';
  static const String uploadImage = 'images';
  static const String fetchLikedImages = 'profile/liked-images';
  static const String likeImage = 'images/like/';
}
