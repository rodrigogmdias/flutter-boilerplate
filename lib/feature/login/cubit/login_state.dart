part of 'login_cubit.dart';

@immutable
sealed class LoginState {
  const LoginState(this.rememberChecked);
  final bool rememberChecked;
}

final class LoginInitial extends LoginState {
  const LoginInitial({bool rememberChecked = false}) : super(rememberChecked);
}

final class LoginSuccess extends LoginState {
  const LoginSuccess() : super(false);
}

final class LoginError extends LoginState {
  const LoginError(this.error) : super(false);

  final String error;
}
