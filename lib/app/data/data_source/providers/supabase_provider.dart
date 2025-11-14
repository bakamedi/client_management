import 'package:client_management/app/core/environment/env_util.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseProvider {
  late final SupabaseClient client;
  late final GoTrueClient auth;

  Future<void> initialize() async {
    final supabase = await Supabase.initialize(
      url: EnvUtil.supabaseUrl,
      anonKey: EnvUtil.supabaseAnonKey,
    );

    auth = supabase.client.auth;
    client = supabase.client;
  }

  Future<FunctionResponse> invoke(
    String functionName, {
    Map<String, String>? headers,
    Object? body,
    Iterable<MultipartFile>? files,
    Map<String, dynamic>? queryParameters,
    HttpMethod method = HttpMethod.post,
    String? region,
  }) {
    return client.functions.invoke(
      functionName,
      headers: headers,
      body: body,
      files: files,
      queryParameters: queryParameters,
      method: method,
      region: region,
    );
  }
}
