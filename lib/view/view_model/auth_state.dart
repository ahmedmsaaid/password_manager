part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class ChangePasswordIconState extends AuthState {}
final class PageChanged extends AuthState {}
