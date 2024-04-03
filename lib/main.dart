import 'package:barber_shop_sm/models/order.dart';
import 'package:barber_shop_sm/screens/haircuts_screen.dart';
import 'package:barber_shop_sm/screens/orders_screen.dart';
import 'package:barber_shop_sm/widgets/tabs_nav.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _screenIndex = 0;
  List<Order> orders = [];

  final List<BottomNavigationBarItem> _tabs = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.assignment),
      label: 'Histórico',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      label: 'Perfil',
    ),
  ];

  _addOrder(Order order) {
    setState(() {
      orders.add(order);
    });
  }

  _removeOrders(int index) {
    setState(() {
      orders.removeAt(index);
    });
  }

  late final _screens = [
    HaircutsScreen(
      onAddOrder: _addOrder,
    ),
    OrdersScreen(
      orders: orders,
      onRemoveOrder: _removeOrders,
    ),
    const Center(child: Text('Teste 3')),
  ];

  _onChangeScreen(int index) {
    setState(() {
      _screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Barber Shop SM'),
        ),
        body: _screens[_screenIndex],
        bottomNavigationBar: TabsNav(
          onChangeScreen: _onChangeScreen,
          tabs: _tabs,
        ),
      ),
    );
  }
}
