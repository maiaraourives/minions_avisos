import '../models/servidor/servidor_model.dart';
import '../models/sessao/sessao_model.dart';

abstract class IServidores {
  ///Busca os servidores disponíveis pro aplicativo
  Future<List<ServidorModel>> fetchServidores();

  ///Faz uma verificação para verificar se a URL do município não mudou
  Future<ServidorModel?> verificaIntegridadeURL(SessaoModel sessao);

  ///Retorna a imagem em base64
  Future<String> recuperarBrasao(ServidorModel servidor);
}
