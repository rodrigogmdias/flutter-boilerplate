import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginInitial());

  StreamSubscription? _authStateChanges;

  void rememberMe(bool value) {
    emit(LoginInitial(rememberChecked: value));
  }

  void checkLogin() {
    _authStateChanges =
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        emit(const LoginSuccess());
      } else {
        emit(const LoginInitial());
      }
    });
  }

  @override
  Future<void> close() {
    _authStateChanges?.cancel();
    return super.close();
  }

  void login(String email, String password) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(const LoginSuccess());
    }).catchError((error) {
      if (error is FirebaseAuthException) {
        emit(LoginError(error.message ?? "An error occurred"));
      } else {
        emit(const LoginError("An error occurred"));
      }
    });
  }

  void loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      emit(const LoginSuccess());
    }).catchError((error) {
      if (error is FirebaseAuthException) {
        emit(LoginError(error.message ?? "An error occurred"));
      } else {
        emit(const LoginError("An error occurred"));
      }
    });
  }
}
