import 'dart:async';

import 'package:bloc_practice/bloc-stream/user.dart';
import 'package:bloc_practice/bloc-stream/user_service.dart';

class UserBLoC {
  Stream<List<User?>?> get usersList async* {
    yield await UserService.browse();
  }

  final StreamController<int> _userCounter = StreamController<int>();

  Stream<int> get userCounter => _userCounter.stream;

  UserBLoC() {
    usersList.listen((list) {
      print('length in constructor=======${list?.length}');
      return _userCounter.add(list != null ? list.length : 0);
    });
  }
}
