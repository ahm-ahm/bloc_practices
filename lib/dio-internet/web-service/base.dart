import 'package:dio/dio.dart';

class Base extends Interceptor {
  static Base instance = Base._();

  Base._();

  Dio get dio => Dio(
        BaseOptions(
          headers: _getAuthorizationHeader,
          baseUrl: 'https://jsonplaceholder.typicode.com',
          connectTimeout: const Duration(seconds: 3),
        ),
      );

  //==================== Header For Dio ===================//
  Map<String, String>? get _getAuthorizationHeader {
    ///=========TODO: get token
    // var accessToken = PreferencesService.getAccessToken();
    /// for test
    String? accessToken;
    if (accessToken == null) {
      return null;
    } else {
      return {
        "Authorization": "Bearer $accessToken",
      };
    }
  }
}
