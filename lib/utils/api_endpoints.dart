class ApiEndPoints {
  static final String baseUrl = 'http://192.168.0.182:8000/api/';
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'auth/register';
  final String loginEmail = 'auth/login';
  final String logoutEmail = 'auth/logout';

  String getUri(String uri){
    return uri;
  }
}