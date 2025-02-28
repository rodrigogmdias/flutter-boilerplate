import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginInitial());

  void rememberMe(bool value) {
    emit(LoginInitial(rememberChecked: value));
  }
}
