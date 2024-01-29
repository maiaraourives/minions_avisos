import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

import '../configs/constants.dart';
import 'shared_service.dart';

final _database = FirebaseDatabase.instance;

class FirebaseService {
  static Future<String?> verificaMensagens() async {
    if (kDebugMode) {
      String? message = await _findMessage('mensagens/Testes');

      return message;
    } else {
      User? currentUser = FirebaseAuth.instance.currentUser;

      //Mensagem
      String? message = await _findMessage(
        'mensagens/$currentUser',
      );

      if (message != null) {
        return message;
      }

      //Mensagem geral
      String? messageGeral = await _findMessage(
        'mensagens/Geral',
      );

      return messageGeral;
    }
  }

  static Future<String?> _findMessage(String path) async {
    DatabaseReference ref = _database.ref(path);

    DatabaseEvent dbData = await ref.once().timeout(const Duration(seconds: 3));

    if (dbData.snapshot.exists) {
      Map<dynamic, dynamic> data = dbData.snapshot.value as Map;

      //Se uma mensagem de mesma data já foi visualizada no dia, evita a repetição
      String? oldData = await SharedService.getString(
        SharedKeys.MENSAGENS_FIREBASE,
      );

      if (data['data'] == oldData || (data['data'] as String).isEmpty) {
        return null;
      }

      await SharedService.saveString(
        SharedKeys.MENSAGENS_FIREBASE,
        data['data'],
      );

      return (data['mensagem'] as String).replaceAll('\\n', '\n').replaceAll('\\t', '\t');
    }

    return null;
  }
}
