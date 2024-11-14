import 'package:antes_prova/Services/database_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Mercadoria {
  String id;
  String nome;
  double altura;
  double largura;
  double peso;

  Mercadoria(
      {required this.id,
      required this.nome,
      required this.altura,
      required this.largura,
      required this.peso});

  static Mercadoria toObj(Map<String, dynamic> mercadoriaMap) {
    return Mercadoria(
        id: mercadoriaMap['id'],
        nome: mercadoriaMap['nome'],
        altura: mercadoriaMap['altura'],
        largura: mercadoriaMap['largura'],
        peso: mercadoriaMap['peso']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'altura': altura,
      'largura': largura,
      'peso': peso
    };
  }

  Future<String> addMercadoriaFireStore(DataBaseFirestore db) async {
    try {
      await db.collection('mercadorias').doc(id).set(toMap());
    } on FirebaseException catch (e) {
      String errorMessage;
      if (e.code == 'permission-denied') {
        errorMessage = "Usuário sem permissão para esta ação";
      } else if (e.code == 'unavailable') {
        errorMessage = "Serviço indisponível. Verifique a conexão.";
      } else {
        errorMessage = "Erro Firestore: ${e.message}";
      }
      return errorMessage;
    } catch (e) {
      return "Erro inesperado no FireBase: $e";
    }
    return '';
  }

  static Future<List<Mercadoria>> getAll(DataBaseFirestore db) async {
    try {
     final querySnapshot =  await db.collection('mercadorias').get();

     return querySnapshot.docs.map((doc) => Mercadoria.toObj(doc.data())).toList();

    } on FirebaseException {
      return [];
    } catch (e) {
      return [];
    }
  }
}
