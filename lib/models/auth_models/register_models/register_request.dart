class RegisterRequest {
  RegisterRequest({
    required this.userName,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  final String userName;
  final String email;
  final String password;
  final String phoneNumber;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
      userName: json['fullName'],
      email: json['email'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() => {
    'fullName': userName,
    'email': email,
    'password': password,
    'phoneNumber': phoneNumber,
  };
}
