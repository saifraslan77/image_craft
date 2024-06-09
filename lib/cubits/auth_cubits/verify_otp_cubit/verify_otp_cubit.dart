import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_craft/cubits/auth_cubits/verify_otp_cubit/verify_otp_state.dart';
import '../../../models/auth_models/verifyotp_models/verify_otp_response.dart';



class VerifyOTPScreenCubit extends Cubit<VerifyOTPScreenState> {
  VerifyOTPScreenCubit() : super(VerifyOTPScreenInitial());

  void verifyOTP(String email, String otp) async {
    try {
      emit(VerifyOTPScreenLoading());

      final response = await Future.delayed(
        const Duration(seconds: 2),
        () => VerifyOTPScreenResponse(success: true),
      );

      if (response.success) {
        emit(VerifyOTPScreenSuccess());
      } else {
        emit(VerifyOTPScreenFailure(message: response.message ?? 'Unknown Error'));
      }
    } catch (e) {
      emit(VerifyOTPScreenFailure(message: e.toString()));
    }
  }
}
