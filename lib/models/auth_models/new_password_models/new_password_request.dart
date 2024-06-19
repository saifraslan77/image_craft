class SetNewPasswordRequest {
  final String newPassword;

  SetNewPasswordRequest({required this.newPassword});

  Map<String, dynamic> toJson() {
    return {
      'newPassword': newPassword,
    };
  }
}
