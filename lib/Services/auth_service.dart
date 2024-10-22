import 'package:antes_prova/Models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> createUser({required Usuario userCreated}) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: userCreated.email, password: userCreated.password);
      await userCredential.user!.updateDisplayName(userCreated.nomeUsuario);

      User? user = userCredential.user;

      if(user == null) return "Erro ao cadastrar usuário, tente novamente mais tarde"; 

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

  Future<void> loginUser({required Usuario userLogged}) async {
    _firebaseAuth.signInWithEmailAndPassword(
        email: userLogged.email, password: userLogged.password);
  }

  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
