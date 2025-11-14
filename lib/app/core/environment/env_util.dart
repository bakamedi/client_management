import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class EnvUtil {
  EnvUtil._();

  static String get supabaseUrl => dotenv.get('SUPABASE_URL');
  static String get supabaseAnonKey => dotenv.get('SUPABASE_ANONKEY');

  static Future<void> loadEnv() async {
    await dotenv.load(fileName: '.env');
  }
}
