// class UserInfo {
//   final String username;
//   final int followingNum;
//   final int followersNum;
//   final String imageProfilePath;
//
//   UserInfo({
//     required this.username,
//     required this.followingNum,
//     required this.followersNum,
//     required this.imageProfilePath,
//   });
//
//   factory UserInfo.fromJson(Map<String, dynamic> json) {
//     return UserInfo(
//       username: json['username'],
//       followingNum: json['followingNum'],
//       followersNum: json['followersNum'],
//       imageProfilePath: json['imageProfilePath'],
//     );
//   }
// }
class LoadUserProfileResponse {
  LoadUserProfileResponse({
    required this.userInfo,
    required this.uploadedImages,
  });

  final UserInfo? userInfo;
  final List<UploadedImage> uploadedImages;

  factory LoadUserProfileResponse.fromJson(Map<String, dynamic> json){
    return LoadUserProfileResponse(
      userInfo: json["userInfo"] == null ? null : UserInfo.fromJson(json["userInfo"]),
      uploadedImages: json["uploadedImages"] == null ? [] : List<UploadedImage>.from(json["uploadedImages"]!.map((x) => UploadedImage.fromJson(x))),
    );
  }

}

class UploadedImage {
  UploadedImage({
    required this.id,
    required this.imagePath,
  });

  final int? id;
  final String? imagePath;

  factory UploadedImage.fromJson(Map<String, dynamic> json){
    return UploadedImage(
      id: json["id"],
      imagePath: json["imagePath"],
    );
  }

}

class UserInfo {
  UserInfo({
    required this.username,
    required this.followingNum,
    required this.followersNum,
    required this.imageProfilePath,
  });

  final String? username;
  final int? followingNum;
  final int? followersNum;
  final dynamic imageProfilePath;

  factory UserInfo.fromJson(Map<String, dynamic> json){
    return UserInfo(
      username: json["username"],
      followingNum: json["followingNum"],
      followersNum: json["followersNum"],
      imageProfilePath: json["imageProfilePath"],
    );
  }

}
