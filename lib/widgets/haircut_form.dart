import 'dart:math';

import 'package:barber_shop_sm/models/haircut.dart';
import 'package:barber_shop_sm/models/order.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HaircutForm extends StatefulWidget {
  final Haircut haircut;

  const HaircutForm({
    super.key,
    required this.haircut,
  });

  @override
  State<HaircutForm> createState() => _HaircutFormState();
}

class _HaircutFormState extends State<HaircutForm> {
  var haircutCount = 1;
  var date = DateTime.now();

  _onPressed(BuildContext ctx) {
    showDatePicker(
      context: ctx,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    ).then(
      (value) => setState(() {
        date = value!;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    var total = haircutCount * widget.haircut.price;

    const textStyle = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
    );

    return Container(
      margin: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      haircutCount++;
                    });
                  },
                  icon: const Icon(Icons.add)),
              Text(
                '$haircutCount ${widget.haircut.description}',
                style: textStyle,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (haircutCount > 1) {
                      haircutCount--;
                    }
                  });
                },
                icon: const Icon(Icons.remove),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Agendar para:',
                style: textStyle,
              ),
              TextButton(
                onPressed: () {
                  _onPressed(context);
                },
                child: Text(
                  DateFormat('dd/MM/yyyy').format(date),
                  style: textStyle,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total:',
                style: textStyle,
              ),
              Text(
                'R\$ $total',
                style: textStyle,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(
                Order(
                    id: Random().nextDouble().toString(),
                    haircut: widget.haircut,
                    time: date,
                    total: total),
              );
            },
            child: const Text('Agendar'),
          ),
        ],
      ),
    );
  }
}
