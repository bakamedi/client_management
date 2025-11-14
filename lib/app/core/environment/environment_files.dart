/// Clase que tiene por objetivo para obtener que archivos se deberan de cargar
class EnvironmentFiles {
  /// .env
  static String get fileName => '.env';

  /// .env_prod
  static String get prodName => '.env_prod';

  /// .env_dev
  static String get devName => '.env_dev';

  /// .env_qa
  static String get qaName => '.env_qa';
}
