
class ApiRoutes {
  static const String baseUrl = 'http://52.79.115.43:8090/';
  static const String authWithPassword = 'api/collections/users/auth-with-password';
  static const String signUp = 'api/collections/users/records';
  static const String readSecret = 'api/collections/secrets/records?sort=-created';
  static const String uploadSecret = 'api/collections/secrets/records';
}
