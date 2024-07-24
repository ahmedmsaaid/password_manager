part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class ChangePasswordIconState extends AuthState {}

final class PageChanged extends AuthState {}

final class Loading extends AuthState {}

final class Success extends AuthState {}

final class CodeSent extends AuthState {}

final class Error extends AuthState {
  final String msg;

  Error({required this.msg});
}
