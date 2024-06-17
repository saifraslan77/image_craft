import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../apis/api_error.dart';
import '../../../models/auth_models/register_models/register_request.dart';
import '../../../repos/auth_repo.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  Future<void> register() async {
    emit(RegisterLoading());
    try {
      if (fullNameController.text.trim().isEmpty) {
        emit(RegisterFailure("Full name is required"));
        return;
      }

      var response = await AuthRepo.register(RegisterRequest(
        userName: fullNameController.text.trim(), // تم تغيير الاسم هنا
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
