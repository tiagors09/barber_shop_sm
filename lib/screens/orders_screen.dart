import 'package:barber_shop_sm/models/order.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrdersScreen extends StatefulWidget {
  final List<Order> orders;
  final Function(int) onRemoveOrder;

  const OrdersScreen({
    super.key,
    required this.orders,
    required this.onRemoveOrder,
  });

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.orders.length,
      itemBuilder: (ctx, i) => Card(
        key: GlobalObjectKey(widget.orders[i]),
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: ListTile(
          title: Text(widget.orders[i].haircut.description),
          subtitle: Text(DateFormat('dd MM yy').format(widget.orders[i].time)),
          leading: CircleAvatar(
            child: Text(
              'R\$ ${widget.orders[i].haircut.price}',
              style: const TextStyle(fontSize: 11),
            ),
          ),
          trailing: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  widget.onRemoveOrder(i);
                  setState(() {
                    widget.orders.removeAt(i);
                  });
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
