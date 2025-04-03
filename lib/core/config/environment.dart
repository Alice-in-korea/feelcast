final class Environment {
  static const baseUrl = String.fromEnvironment('BASE_URL');
  static const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');
  static const supabaseRedirectUrl = String.fromEnvironment(
    'SUPABASE_REDIRECT_URL',
  );
}
