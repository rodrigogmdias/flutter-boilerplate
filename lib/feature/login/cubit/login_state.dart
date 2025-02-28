part of 'login_cubit.dart';

@immutable
sealed class LoginState {
  const LoginState(this.rememberChecked);
  final bool rememberChecked;
}

final class LoginInitial extends LoginState {
  const LoginInitial({bool rememberChecked = false}) : super(rememberChecked);
}
