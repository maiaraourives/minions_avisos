class TableConfiguracoes {
  static const tableName = 'configuracoes';

  ///[INTEGER] - PK
  static const pkConfiguracao = 'pk_configuracao';

  ///[INTEGER]
  static const biometria = 'biometria';

  ///[INTEGER]
  static const synkedData = 'synked_data';

  ///[REAL]
  static const textFactor = 'text_factor';

  ///[INTEGER]
  static const aceitouPermissoes = 'aceitou_permissoes';

  ///[INTEGER]
  static const darkTheme = 'tema_dark';

  ///[INTEGER]
  static const syncOnWifi = 'sync_on_wifi';

  ///[INTEGER]
  static const imageOnWifi = 'image_on_wifi';

  ///[INTEGER] - FK
  static const pkUsuario = 'pk_usuario';
}
