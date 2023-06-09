import 'package:bloc_practice/dio-internet/web-service/base.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../model.dart';

abstract class WebServices {
  static Future<dynamic> getData() async {
    try {
      final response = await Base.instance.dio.get('/todos');
      if (response.statusCode == 200) {
        return compute(getResponseOfData, response.data);
      }
    } on DioError catch (e) {
      return e;
    }
  }
}

//======================call compute of getData
List<Model> getResponseOfData(dynamic data) {
  final l = data;
  final List<Model> list =
      List.generate(l.length, (index) => Model.fromJson(l[index]));
  return list;
}
