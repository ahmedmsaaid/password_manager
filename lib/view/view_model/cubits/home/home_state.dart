part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class PageChanged extends HomeState {}

final class DrobDown extends HomeState {}
