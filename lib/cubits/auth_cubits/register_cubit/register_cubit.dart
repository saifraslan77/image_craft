import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_craft/apis/api_error.dart';
import 'package:image_craft/repos/auth_repo.dart';
import 'package:image_craft/models/auth_models/register_models/register_request.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  Future<void> register() async {
    emit(RegisterLoading());
    try {
      // التحقق من أن قيمة حقل userName ليست فارغة
      if (fullNameController.text.trim().isEmpty) {
        emit(RegisterFailure("fullName is required"));
        return;
      }

      var response = await AuthRepo.register(RegisterRequest(
        userName: fullNameController.text.trim(), // استخدام fullName ك userName
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        phoneNumber: phoneNumberController.text.trim(),
      ));
      emit(RegisterSuccess(response.message ?? 'Registration successful'));
    } on Exception catch (e) {
      String error = APIError.getErrorMessage(e);
      print(error);
      emit(RegisterFailure(error));
    }
  }

  @override
  Future<void> close() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
    return super.close();
  }
}
