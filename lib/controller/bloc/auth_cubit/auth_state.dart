part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class SuccessCreateAuthState extends AuthState {}

final class WaitCreateAuthState extends AuthState {}

final class FialdCreateAuthState extends AuthState {
  final String massage;
  FialdCreateAuthState({required this.massage});
}

//
final class SuccessloginAuthState extends AuthState {}

final class WaitloginAuthState extends AuthState {}

final class FialdloginAuthState extends AuthState {
  final String massage;
  FialdloginAuthState({required this.massage});
}
