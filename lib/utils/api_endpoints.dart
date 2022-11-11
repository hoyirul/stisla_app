class ApiEndPoints {
  static final String baseUrl = 'http://192.168.1.2:8000/api/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'auth/register';
  final String loginEmail = 'auth/login';
  final String logoutEmail = 'auth/logout';
}