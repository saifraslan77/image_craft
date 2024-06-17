import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_craft/repos/auth_repo.dart';
import 'set_new_password_state.dart';
import '../../../models/auth_models/new_password_models/new_password_request.dart';

class SetNewPasswordCubit extends Cubit<SetNewPasswordState> {

  SetNewPasswordCubit(AuthRepo authRepo) : super(SetNewPasswordState.initial());

  Future<void> setNewPassword(String newPassword) async {
    emit(SetNewPasswordState.loading());
    try {
      final request = SetNewPasswordRequest(newPassword: newPassword);
      final response = await AuthRepo.setNewPassword(request);
      if (response.message == 'Password updated successfully') {
        emit(SetNewPasswordState.success());
      } else {
        emit(SetNewPasswordState.failure('Password update failed'));
      }
    } catch (e) {
      emit(SetNewPasswordState.failure(e.toString()));
    }
  }
}
