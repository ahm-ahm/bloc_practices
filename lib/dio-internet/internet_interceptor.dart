import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

class InternetInterceptor extends Interceptor {
  @override
  void onError(DioError err,ErrorInterceptorHandler f)  {
    final bool isInternetIssue=_shouldRetry(err);
    log(isInternetIssue.toString());
    if(isInternetIssue){

    }
  }
  //e.type == DioErrorType.CONNECT_TIMEOUT || e.type == DioErrorType.RECEIVE_TIMEOUT
  bool _shouldRetry(DioError err) {
    return err.type == DioErrorType.connectionTimeout &&
        err.error != null &&
        err.error is SocketException;
  }

}