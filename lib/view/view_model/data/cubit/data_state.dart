part of 'data_cubit.dart';

@immutable
abstract class DataState {}

final class DataInitial extends DataState {}

final class LoadingAddData extends DataState {}

final class SuccessAddData extends DataState {}

final class ErrorAddData extends DataState {
  final String msg;

  ErrorAddData({required this.msg});
}

final class LoadinGetdData extends DataState {}

final class SuccessGetData extends DataState {}

final class ErrorGetData extends DataState {
  final String msg;

  ErrorGetData({required this.msg});
}

final class ColorChanged extends DataState {}

final class SrtingthChanged extends DataState {}

final class PasswordGenerated extends DataState {}

final class LoadingColorChangnig extends DataState {}

final class LoadingSrtingthChangnig extends DataState {}

final class LoadingPasswordGeneratnig extends DataState {}

final class LoadingchangePasswordLength extends DataState {}

final class ChangePasswordLength extends DataState {}

final class Checkboxs extends DataState {}

final class Deleting extends DataState {}

final class Seacrhed extends DataState {}

final class Seacrhing extends DataState {}

final class ShowDeatelsButton extends DataState {}

final class Deleted extends DataState {}

final class DeleteError extends DataState {
  final String msg;

  DeleteError(this.msg);
}
