// ignore_for_file: constant_identifier_names

///Armazena dados constantes do APP
class App {
  static const NAME = 'Avisos Minions';

  static const VERSION = '1.0.0';

  static const DATA_ATUALIZACAO = '18/07/2023';
}

enum ErrorType {
  generic,
  internet,
  login,
  login_offline,
  http_request,
  session,
  sync,
  expiredToken,
  cadastro,
  gps,
  upload_anexo,
}

enum DialogAction { ok, sim_nao, none }

enum SourceRecognition { testar, ponto }

class SharedKeys {
  static const SECURE_JWT = 'secure_token_jwt';

  static const SECURE_PASS = 'secure_password';

  static const SYNC_CHAMADA = 'sync_chamada_data';

  static const MENSAGENS_FIREBASE = 'avisos_pendecias_firebase';

  static const NOTIFICACAO = 'avisos_pendecias_notificacao';

  static const FIRST_SYNC = 'first_sync_avisos_pendecias';
}

class CadOptions {
  static const SIM = 1;

  static const NAO = 0;

  static const MASCULINO = 1;

  static const FEMININO = 0;
}

enum NormalizeDate {
  ///dd/MM/yyyy
  br_format,
  //HH:mm:ss
  just_hour
}

class SearchLimit {
  static const GERAL = 20;
}

enum TypeSwitchConfig { one_value, two_values }
