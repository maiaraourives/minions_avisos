// ignore_for_file: unused_element

import 'package:mobx/mobx.dart';

import '../../utils/functions_utils.dart';

class DadosUsuarioModel {
  DadosUsuarioModel();

  DadosUsuarioModel.fromDatabase(Map data) {
    _codigoUsuario = data['CODIGO_USUARIO'];
    _email = data['EMAIL'];
    _nome = data['NOME'];
    _dataNascimento = convertDataDB(data['DATA_NASCIMENTO']);
    _celular = data['CELULAR'];
    _cep = data['CEP'];
    _municipio = data['CIDADE_DESCRICAO'];
    _uf = data['UF'];
    _endereco = data['ENDERECO'];
    _bairro = data['BAIRRO'];
    _complemento = data['COMPLEMENTO'];
    _sexo = data['SEXO_USUARIO'];
    _numeroCasa = data['NUMERO_CASA'];
    _cpf = data['CPF'];
  }

  int? _codigoUsuario;
  String? _email;
  String? _nome;
  DateTime? _dataNascimento;
  String? _celular;
  String? _cep;
  String? _municipio;
  String? _uf;
  String? _endereco;
  String? _bairro;
  String? _complemento;
  int? _sexo;
  String? _numeroCasa;
  String? _cpf;

  void setCodigoUsuario(int codigo) {
    _codigoUsuario = codigo;
  }

  int? get codigoUsuario => _codigoUsuario;

  void setEmail(String? email) {
    _email = email;
  }

  String? get email => _email;

  void setNome(String? nome) {
    _nome = nome;
  }

  String? get nome => _nome;

  @action
  void setDataNascimento(DateTime? data) {
    _dataNascimento = data;
  }

  @computed
  DateTime? get dataNascimento => _dataNascimento;

  bool isBirthday() {
    if (!isNullOrEmpty(_dataNascimento)) {
      return isSameTime(_dataNascimento!, DateTime.now());
    }

    return false;
  }

  void setCelular(String? celular) {
    _celular = celular;
  }

  String? get celular => _celular;

  void setCEP(String? cep) {
    _cep = cep;
  }

  String? get cep => _cep;

  void setMunicipio(String? cidade) {
    _municipio = cidade;
  }

  String? get municipio => _municipio;

  void setUF(String? uf) {
    _uf = uf;
  }

  String? get uf => _uf;

  void setEndereco(String? endereco) {
    _endereco = endereco;
  }

  String? get endereco => _endereco;

  void setBairro(String? bairro) {
    _bairro = bairro;
  }

  String? get bairro => _bairro;

  String? get bairroNumero => '$_bairro, $_numeroCasa';

  void setComplemento(String? complemento) {
    _complemento = complemento;
  }

  String? get complemento => _complemento;

  void setSexo(int? sexo) {
    _sexo = sexo;
  }

  int? get sexo => _sexo;

  void setNumeroCasa(String? numero) {
    _numeroCasa = numero;
  }

  String? get numeroCasa => _numeroCasa;

  void setCPF(String? cpf) {
    _cpf = cpf;
  }

  String? get cpf => _cpf;

  String formatMunicipioUF() {
    _municipio ??= '';
    _uf ??= '';

    if (_municipio!.isNotEmpty && _uf!.isNotEmpty) {
      return '$_municipio, $_uf';
    }

    return '';
  }
}
