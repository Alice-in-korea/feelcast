final class Environment {
  static const publicApiBaseUrl = String.fromEnvironment('PUBLIC_API_WEATHER_BASE_URL');
  static const publicApiKey = String.fromEnvironment('PUBLIC_API_KEY');
  static const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');
  static const supabaseRedirectUrl = String.fromEnvironment(
    'SUPABASE_REDIRECT_URL',
  );
}
