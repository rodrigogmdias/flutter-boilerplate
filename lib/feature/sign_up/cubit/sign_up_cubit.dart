import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  void signUp(String email, String password, String name) {
    emit(SignUpLoading());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      value.user!.updateProfile(displayName: name);
      emit(SignUpSuccess());
    }).catchError((error) {
      emit(SignUpFailed(error.toString()));
    });
  }
}
