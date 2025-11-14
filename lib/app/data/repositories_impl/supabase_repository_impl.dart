import 'package:client_management/app/data/data_source/providers/supabase_provider.dart';
import 'package:client_management/app/domain/respositories/supabase_repository.dart';

class SupabaseRepositoryImpl extends SupabaseRepository {
  SupabaseRepositoryImpl({required SupabaseProvider supabaseProvider})
    : _supabaseProvider = supabaseProvider;
  final SupabaseProvider _supabaseProvider;

  @override
  Future<void> initialize() async {
    await _supabaseProvider.initialize();
  }
}
