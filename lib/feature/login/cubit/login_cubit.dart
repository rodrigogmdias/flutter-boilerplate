import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginInitial());

  void rememberMe(bool value) {
    emit(LoginInitial(rememberChecked: value));
  }

  void checkLogin() {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      emit(const LoginSuccess());
    }
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
