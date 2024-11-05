import 'dart:io';

import 'package:antes_prova/Models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> createUser({required Usuario userCreated}) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: userCreated.email, password: userCreated.password);
      await userCredential.user!.updateDisplayName(userCreated.nomeUsuario);

      User? user = userCredential.user;

      if (user == null) {
        return "Erro ao cadastrar usuário, tente novamente mais tarde";
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'weak-password') {
        errorMessage = 'A senha é muito fraca.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'Este email já está em uso.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'Email inválido.';
      } else {
        errorMessage = 'Erro desconhecido: ${e.message}';
      }

      return errorMessage;
    } catch (e) {
      return 'Erro ao criar Usuário na base de dados';
    }
    return '';
  }

  Future<String> loginGoogle() async {
  try {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      return '';
    }
    return 'O usuário cancelou a autenticação com o Google.';
  } on FirebaseAuthException catch (e) {
    if (e.code == 'account-exists-with-different-credential') {
      return 'A conta já existe com outra credencial.';
    } else if (e.code == 'invalid-credential') {
      return 'A credencial do Google é inválida ou expirou.';
    } else {
      return 'Erro de autenticação: ${e.message}';
    }
  } on SocketException {
    return 'Erro de rede. Verifique sua conexão com a internet.';
  } catch (e) {
    return 'Erro ao logar com Google: $e';
  }
}

  Future<String> loginUser({required Usuario userLogged}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: userLogged.email, password: userLogged.password);
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'invalid-credential') {
        errorMessage = 'Email e/ou Senha inválido(s)';
      } else if (e.code == 'too-many-requests') {
        errorMessage =
            'Muitas tentativas não sucedidas foram efetuadas. Tente novamente mais tarde.';
      } else {
        errorMessage = 'Erro ao efetuar login: ${e.code}';
      }
      return errorMessage;
    } catch (e) {
      return "Erro ao efetuar Login";
    }
    return '';
  }

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
