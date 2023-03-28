import 'package:bloc_practice/bottom-navigation-bar/screens/home.dart';
import 'package:bloc_practice/bottom-navigation-bar/screens/setting.dart';
import 'package:bloc_practice/bottom-navigation-bar/screens/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation_bloc.dart';
class CustomBottomNavigation extends StatefulWidget {
  @override
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  // Home? home;
  final pages = [
    HomeScreen(),
    ViewScreen(),
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    print('build is rebuild--->');
    return BlocBuilder<NavigationBloc, int>(
      builder: (context, state) => Scaffold(
        body: _getPage(page: state),
        bottomNavigationBar: CustomBottomNavigationBar(
          iconList:const [
            Icons.home,
            Icons.view_array_outlined,
            Icons.person,
          ],
          onChange: (val) {
            if (state == val) return;
            print('-----------------$val');
            context.read<NavigationBloc>().pageChanged(index: val);
          },
        ),
      ),
    );
  }

  Widget _getPage({required int page}) {
    return pages[page];
  }
}


class CustomBottomNavigationBar extends StatefulWidget {
  // final Function(int) onChange;
  final Function onChange;
  final List<IconData> iconList;

 const CustomBottomNavigationBar({required this.iconList, required this.onChange});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    // _iconList = widget.iconList;
    print('the length is -- > ${widget.iconList.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(widget.iconList.length,
                (index) => buildNavBarItem(widget.iconList[index], index)));
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        _selectedIndex = index;
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / widget.iconList.length,
        decoration: index == _selectedIndex
            ? BoxDecoration(
            border:const Border(
              bottom: BorderSide(width: 4, color: Colors.green),
            ),
            gradient: LinearGradient(colors: [
              Colors.green.withOpacity(0.3),
              Colors.green.withOpacity(0.015),
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter))
            : const BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedIndex ? Colors.black : Colors.grey,
          size: index == _selectedIndex ? 25.0 : 20.0,
        ),
      ),
    );
  }
}
