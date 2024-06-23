import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_craft/apis/api_error.dart';
import 'package:image_craft/models/auth_models/login_models/login_request.dart'
    as login_models;
import 'package:image_craft/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    emit(LoginLoading());
    try {
      print(emailController.text);
      print(passwordController.text);
      var response = await AuthRepo.login(
        login_models.LoginRequest(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        ),
      );
      emit(LoginSuccess());
    } on Exception catch (e) {
      String error = APIError.getErrorMessage(e);
      emit(LoginFailure(error));
    }
  }
}
