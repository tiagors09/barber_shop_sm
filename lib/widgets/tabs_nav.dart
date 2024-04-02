import 'package:flutter/material.dart';

class TabsNav extends StatefulWidget {
  final List<BottomNavigationBarItem> tabs;
  final Function(int)? onChangeScreen;

  const TabsNav({
    super.key,
    required this.onChangeScreen,
    required this.tabs,
  });

  @override
  State<TabsNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<TabsNav> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        widget.onChangeScreen!(value);
        setState(() {
          _currentIndex = value;
        });
      },
      items: widget.tabs,
      currentIndex: _currentIndex,
    );
  }
}
