import 'package:barber_shop_sm/models/order.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrdersScreen extends StatelessWidget {
  final List<Order> orders;
  final Function(int) onRemoveOrder;

  const OrdersScreen({
    super.key,
    required this.orders,
    required this.onRemoveOrder,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (ctx, i) => Card(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: ListTile(
          title: Text(orders[i].haircut.description),
          subtitle: Text(DateFormat('dd MM yy').format(orders[i].time)),
          leading: CircleAvatar(
            child: Text(
              'R\$ ${orders[i].haircut.price}',
              style: const TextStyle(fontSize: 11),
            ),
          ),
          trailing: IconButton(
            onPressed: () => onRemoveOrder(i),
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
