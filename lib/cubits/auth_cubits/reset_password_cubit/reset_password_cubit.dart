import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../apis/api_error.dart';
import '../../../models/auth_models/reset_password _models/reset_password_request.dart';
import '../../../repos/auth_repo.dart';
part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  @override
  Future<void> close() {
    emailController.dispose();
    otpController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> requestOTP() async {
    emit(ResetPasswordLoading());
    try {
      await AuthRepo.resetPassword(
        ResetPasswordRequest(email: emailController.text.trim()),
      );
      emit(ResetPasswordOTPSent());
    } on Exception catch (e) {
      String error = APIError.getErrorMessage(e);
      emit(ResetPasswordFailure(error));
    }
  }

  Future<void> verifyOTP() async {
    emit(ResetPasswordLoading());
    try {
      if (otpController.text.trim().length == 6) {
        emit(ResetPasswordOTPSuccess());
      } else {
        emit(ResetPasswordFailure("Invalid OTP"));
      }
    } on Exception catch (e) {
      String error = APIError.getErrorMessage(e);
      emit(ResetPasswordFailure(error));
    }
  }

  Future<void> resetPassword() async {
    emit(ResetPasswordLoading());
    try {
      await AuthRepo.resetPassword(
        ResetPasswordRequest(
          email: emailController.text.trim(),
          otp: otpController.text.trim(),
          newPassword: newPasswordController.text.trim(),
        ),
      );
      emit(ResetPasswordSuccess());
    } on Exception catch (e) {
      String error = APIError.getErrorMessage(e);
      emit(ResetPasswordFailure(error));
    }
  }
}
