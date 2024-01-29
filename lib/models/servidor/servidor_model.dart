class ServidorModel {
  ServidorModel.fromDatabase(Map data) {
    codigo = data['MUNICIPIO_CODIGO'];
    _url = data['URL_SERVIDOR'];
    nome = data['MUNICIPIO'];
  }

  ServidorModel.fromWeb(Map data) {
    codigo = data['codigoEducar'];
    _url = data['url'];
    nome = data['nome'];
  }

  late final int codigo;
  late final String _url;
  late final String nome;
  String? brasao;

  String get url {
    final uri = Uri.parse(_url);

    return uri.origin;
  }
}
