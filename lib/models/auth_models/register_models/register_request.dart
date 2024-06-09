class RegisterRequest {
  RegisterRequest({
    required this.userName, // Changed from fullName to userName
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  final String userName; // Changed from fullName to userName
  final String email;
  final String password;
  final String phoneNumber;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
      userName: json['fullName'], // Changed from fullName to userName
      email: json['email'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() => {
    'fullName': userName, // Changed from fullName to userName
    'email': email,
    'password': password,
    'phoneNumber': phoneNumber,
  };
}
