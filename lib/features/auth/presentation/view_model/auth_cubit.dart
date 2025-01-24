import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:test_firebase/features/auth/data/repo/auth_repo_impl.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  AuthRepoImpl authRepoImpl = AuthRepoImpl();
  Future<void> loginAccount({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await authRepoImpl.loginAccount(email: email, password: password);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthFailure(errorMessage: 'user-not-found'));
      } else if (e.code == 'wrong-password') {
        emit(AuthFailure(errorMessage: 'wrong-password'));
      } else {
        emit(AuthFailure(errorMessage: 'FirebaseAuthException: ${e.message}'));
      }
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }
  Future<void> registerAccount({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await authRepoImpl.registerNewAccount(email: email, password: password);
      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(AuthFailure(errorMessage: 'user-not-found'));
      } else if (e.code == 'wrong-password') {
        emit(AuthFailure(errorMessage: 'wrong-password'));
      } else {
        emit(AuthFailure(errorMessage: 'FirebaseAuthException: ${e.message}'));
      }
    } catch (e) {
      emit(AuthFailure(errorMessage: e.toString()));
    }
  }


  String? validate(String? value) {
    if (value!.isEmpty) {
      return 'wrong';
    } else {
      return null;
    }
  }
}
