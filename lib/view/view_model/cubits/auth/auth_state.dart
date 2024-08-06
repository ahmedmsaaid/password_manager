part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class ChangePasswordIconState extends AuthState {}

final class PageChanged extends AuthState {}

final class Loading extends AuthState {}

final class Success extends AuthState {}

final class LoadingRigester extends AuthState {}

final class SuccessRigester extends AuthState {}

final class LoadingAddUserToFireStore extends AuthState {}

final class SuccessAddUserToFireStore extends AuthState {}

final class FaildAddUserToFireStore extends AuthState {
  final String msg;
  FaildAddUserToFireStore({required this.msg});
}

final class CodeSent extends AuthState {}

final class Error extends AuthState {
  final String msg;

  Error({required this.msg});
}

final class ErrorRigester extends AuthState {
  final String msg;

  ErrorRigester({required this.msg});
}

final class LoadingGetUserData extends AuthState {}

final class SuccessGetUserData extends AuthState {}

final class ErrorGetUserData extends AuthState {
  final String msg;

  ErrorGetUserData({required this.msg});
}
