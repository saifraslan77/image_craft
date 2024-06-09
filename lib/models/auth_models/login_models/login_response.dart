class LoginResponse {
    LoginResponse({
        this.message,
        this.accessToken,
    });

    final String? message;
    final String? accessToken;

    factory LoginResponse.fromJson(Map<String, dynamic> json){ 
        return LoginResponse(
            message: json["message"],
            accessToken: json["accessToken"],
        );
    }

    Map<String, dynamic> toJson() => {
        "message": message,
        "accessToken": accessToken,
    };

}
