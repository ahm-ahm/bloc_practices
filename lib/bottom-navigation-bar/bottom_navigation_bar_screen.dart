import 'package:bloc_practice/bottom-navigation-bar/NavigationbarBloc.dart';
import 'package:bloc_practice/bottom-navigation-bar/screens/home.dart';
import 'package:bloc_practice/bottom-navigation-bar/screens/setting.dart';
import 'package:bloc_practice/bottom-navigation-bar/screens/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigationbar_state.dart';

class BottomNavigationbarScreen extends StatefulWidget {
  const BottomNavigationbarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationbarScreen> createState() =>
      _BottomNavigationbarScreenState();
}

class _BottomNavigationbarScreenState extends State<BottomNavigationbarScreen> {
  final _screens=const [HomeScreen(),ViewScreen(),SettingScreen()];
  @override
  Widget build(BuildContext context) {
    print('object');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera'),
      ),
      body: BlocBuilder<NavigationbarBloc, NavigationbarState>(
          buildWhen: (pre, next) {
            return pre != next;
          }, builder: (context, state) {
          return _screens[state.selecctedIndex];
        }
      ),
      bottomNavigationBar: BlocBuilder<NavigationbarBloc, NavigationbarState>(
          buildWhen: (pre, next) {
        return pre != next;
      }, builder: (context, state) {
        return BottomNavigationBar(
          onTap: (index) {
            context.read<NavigationbarBloc>().updateIndex(index);
          },
          currentIndex: state.selecctedIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.view_agenda), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          ],
        );
      }),
    );
  }
}
