import '../configs/constants.dart';
import '../models/erros/error_model.dart';
import '../models/sessao/sessao_model.dart';
import '../services/secure_storage_service.dart';
import '../services/service_locator.dart';

Future<String> retornaJWT() async {
  final sessao = getIt<SessaoModel>();

  return (await SecureStorageService.read(SharedKeys.SECURE_JWT, suffix: '${sessao.usuario!}${sessao.dadosUsuario.codigoUsuario}'))!;
}

///Invalida o token JWT do usuário
Future<void> resetJWT() async {
  final sessao = getIt<SessaoModel>();

  await SecureStorageService.save(SharedKeys.SECURE_JWT, '', suffix: '${sessao.usuario!}${sessao.dadosUsuario.codigoUsuario}');
}

void validaResponse(
  Map response, [
  ErrorType? type,
]) {
  if (response['status'] != 'success') {
    if (type == null) {
      throw ErrorModel(response['message']);
    }

    throw ErrorModel.type(response['message'] ?? 'Ocorreu um erro desconhecido', type);
  }
}
