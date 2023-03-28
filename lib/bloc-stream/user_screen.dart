import 'package:bloc_practice/bloc-stream/user_bloc.dart';
import 'package:flutter/material.dart';

import 'user.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});
  @override
  Widget build(BuildContext context) {
    UserBLoC userBLoC = UserBLoC();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        actions: [
          Chip(
            label: StreamBuilder<int>(
                stream: userBLoC.userCounter,
                builder: (context, snapshot) {
                  return Text(
                    (snapshot.data ?? 0).toString(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  );
                }),
            backgroundColor: Colors.red,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16),
          )
        ],
      ),
      body: StreamBuilder(
          stream: userBLoC.usersList,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(
                      child: Text(snapshot.error.toString().split(':').last));
                }
                List<User>? users =
                    snapshot.data == null ? null : snapshot.data as List<User>;

                return ListView.separated(
                  itemCount: users?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    User? user = users != null ? users[index] : null;
                    return ListTile(
                      title: Text(user == null ? 'No Name' : user.name!),
                      subtitle: Text(user == null ? 'No email' : user.email!),
                      leading: CircleAvatar(
                        child: Text(user == null
                            ? 'No city'
                            : user.name!.substring(0, 1).toString()),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                );
            }
          }),
    );
  }
}
