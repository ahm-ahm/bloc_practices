import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import './user.dart';

class UserService {
  static String url = 'https://jsonplaceholder.typicode.com/users';
  static Future<List<User?>?> browse() async {
    List collection;
    List<User?>? contacts;
    try {
      var response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 20));
      if (response.statusCode == 200) {
        collection = convert.jsonDecode(response.body);
        contacts = collection.map((json) => User.fromJson(json)).toList();
      } else {
        print('Request failed with status: ${response.statusCode}.');

        throw Exception(response.reasonPhrase);
      }

      return contacts;
    } catch (e) {
      log('error ----------$e');
      throw Exception('No Internet');
    }
  }
}
