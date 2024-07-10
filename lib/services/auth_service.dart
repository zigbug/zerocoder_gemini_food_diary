import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Получение текущего пользователя
  User? get currentUser => _auth.currentUser;

  // Регистрация с помощью email и пароля
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Отправка письма для верификации
      await userCredential.user!.sendEmailVerification();

      return userCredential;
    } catch (e) {
      rethrow; // Переброс ошибки
    }
  }

  // Вход с помощью email и пароля
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      rethrow; // Переброс ошибки
    }
  }

  // Вход с помощью Google
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } catch (e) {
      rethrow; // Переброс ошибки
    }
  }

  // Выход из аккаунта
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      rethrow; // Переброс ошибки
    }
  }

  // Верификация почты
  Future<void> verifyEmail() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
    } catch (e) {
      rethrow; // Переброс ошибки
    }
  }
}
