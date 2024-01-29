import '../models/sessao/sessao_model.dart';

abstract class IUsuarios {
  ///Efetua o login do usuário
  Future<void> login(SessaoModel sessao);

  ///Salva um usuário localmente no banco
  Future<void> salvarUsuario(SessaoModel sessao);

  ///Utilizado apenas para atualizar as configurações do usuário logado
  Future<void> updateConfiguracoes(SessaoModel sessao);

  ///Busca as configurações do usuário logado e aplica as alterações
  Future<void> buscarConfiguracoes();

  ///Faz a busca do último login registrado no app, utilizado para o login automático
  Future<SessaoModel> lastLogin();

  ///Valida se o token JWT ainda é válido
  Future<void> validarToken();

  ///Busca todos os usuários que em algum momento logaram no aplicativo
  Future<List<SessaoModel>> buscarUsuarios();

  Future<(bool, String?)> loginOffline(SessaoModel sessao);

  Future<void> atualizarSenha(String senhaAntiga, String senhaNova, String confirmaSenha);

  ///Atualiza o usuário no banco local
  Future<void> updateUsuario(SessaoModel sessao);

  Future<void> fetchUsuariosInfo();

  Future<void> excluirUsuario(SessaoModel usuario);
}
