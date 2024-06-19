enum SetNewPasswordStatus { initial, loading, success, failure }

class SetNewPasswordState {
  final SetNewPasswordStatus status;
  final String? errorMessage;

  SetNewPasswordState({required this.status, this.errorMessage});

  // Factory constructors for different states
  factory SetNewPasswordState.initial() => SetNewPasswordState(status: SetNewPasswordStatus.initial);
  factory SetNewPasswordState.loading() => SetNewPasswordState(status: SetNewPasswordStatus.loading);
  factory SetNewPasswordState.success() => SetNewPasswordState(status: SetNewPasswordStatus.success);
  factory SetNewPasswordState.failure(String errorMessage) => SetNewPasswordState(status: SetNewPasswordStatus.failure, errorMessage: errorMessage);
}
