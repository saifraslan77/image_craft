import 'package:meta/meta.dart';

@immutable
abstract class VerifyOTPScreenState {}

class VerifyOTPScreenInitial extends VerifyOTPScreenState {}

class VerifyOTPScreenLoading extends VerifyOTPScreenState {}

class VerifyOTPScreenSuccess extends VerifyOTPScreenState {}

class VerifyOTPScreenFailure extends VerifyOTPScreenState {
  final String message;

  VerifyOTPScreenFailure({required this.message});
}
