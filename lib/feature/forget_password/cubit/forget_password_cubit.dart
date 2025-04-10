import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  void resetPassword(String email) {
    emit(ForgetPasswordLoading());
    FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) {
      emit(ForgetPasswordSuccess());
    }).catchError((error) {
      emit(ForgetPasswordFailed(error.toString()));
    });
  }
}
